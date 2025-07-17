import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'model/video_model.dart';
import 'video_controller_service.dart';

class ReelsController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  final PageController pageController = PageController(
    viewportFraction: 0.99999,
  );
  final CachedVideoControllerService videoControllerService =
      CachedVideoControllerService(DefaultCacheManager());

  final RxList<VideoPlayerController> videoPlayerControllerList =
      <VideoPlayerController>[].obs;

  final loading = true.obs;
  final visible = false.obs;
  late AnimationController animationController;
  late Animation animation;

  final RxList<VideoModel> videoList = <VideoModel>[].obs;
  final List<String> caching = [];
  final List<int> alreadyListened = [];

  final int startIndex;
  final List<VideoModel> reelsVideoList;
  final bool isCaching;

  RxInt pageCount = 0.obs;

  Timer? timer;
  int page = 1;
  int limit = 10;
  int loadLimit = 4;
  bool init = false;
  int? lastIndex;

  bool get isFirstVideoReady =>
      videoPlayerControllerList.isNotEmpty &&
      videoPlayerControllerList[0].value.isInitialized;

  ReelsController({
    required this.reelsVideoList,
    required this.isCaching,
    this.startIndex = 0,
  });

  @override
  void onInit() {
    super.onInit();
    videoList.addAll(reelsVideoList);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    initService(startIndex: startIndex);

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (lastIndex != null) {
        initNearByVideos(lastIndex!);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    for (var controller in videoPlayerControllerList) {
      controller.pause();
      controller.dispose();
    }
    timer?.cancel();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      for (var controller in videoPlayerControllerList) {
        controller.pause();
      }
    }
  }

  Future<void> initService({int startIndex = 0}) async {
    await addVideosController();
    int index = startIndex;

    try {
      if (!videoPlayerControllerList[index].value.isInitialized) {
        cacheVideo(index);
        await videoPlayerControllerList[index].initialize();
        increasePage(index + 1);
      }
    } catch (e) {
      log('Error initializing video at index $index: $e');
    }

    animationController.repeat();
    videoPlayerControllerList[index].play();
    refreshView();
    await initNearByVideos(index);
    loading.value = false;

    //  FIXED: Only call jumpToPage after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.jumpToPage(index);
      }
    });
  }

  Future<void> addVideosController() async {
    for (var videoModel in videoList) {
      final controller = await videoControllerService.getControllerForVideo(
        videoModel,
        isCaching,
      );
      videoPlayerControllerList.add(controller);
    }
  }

  Future<void> initNearByVideos(int index) async {
    if (init) {
      lastIndex = index;
      return;
    }
    init = true;
    lastIndex = null;
    if (loading.value) return;

    await disposeNearByOldVideoControllers(index);
    await tryInit(index);

    try {
      int maxPage = index + loadLimit;

      for (var i = index; i < maxPage; i++) {
        if (videoList.asMap().containsKey(i)) {
          var controller = videoPlayerControllerList[i];
          if (!controller.value.isInitialized) {
            cacheVideo(i);
            await controller.initialize();
            increasePage(i + 1);
            refreshView();
          }
        }
      }

      for (var i = index - 1; i > index - loadLimit; i--) {
        if (videoList.asMap().containsKey(i)) {
          var controller = videoPlayerControllerList[i];
          if (!controller.value.isInitialized) {
            cacheVideo(i);
            await controller.initialize();
            increasePage(i + 1);
            refreshView();
          }
        }
      }
    } catch (e) {
      log("Error initializing nearby videos: $e");
    } finally {
      loading.value = false;
      init = false;
    }
  }

  Future<void> tryInit(int index) async {
    var oldController = videoPlayerControllerList[index];
    if (oldController.value.isInitialized) {
      oldController.play();
      refresh();
      return;
    }

    var newController = await videoControllerService.getControllerForVideo(
      videoList[index],
      isCaching,
    );
    videoPlayerControllerList[index] = newController;
    await oldController.dispose();
    refreshView();

    cacheVideo(index);

    await newController.initialize().catchError((e) {}).then((_) {
      newController.play();
      refresh();
    });
  }

  Future<void> disposeNearByOldVideoControllers(int index) async {
    loading.value = false;

    for (var i = index - loadLimit; i > 0; i--) {
      if (!videoPlayerControllerList.asMap().containsKey(i)) continue;

      var oldController = videoPlayerControllerList[i];
      var newController = await videoControllerService.getControllerForVideo(
        videoList[i],
        isCaching,
      );
      videoPlayerControllerList[i] = newController;
      alreadyListened.remove(i);
      await oldController.dispose();
      refreshView();
    }

    for (var i = index + loadLimit; i < videoPlayerControllerList.length; i++) {
      if (!videoPlayerControllerList.asMap().containsKey(i)) continue;

      var oldController = videoPlayerControllerList[i];
      var newController = await videoControllerService.getControllerForVideo(
        videoList[i],
        isCaching,
      );
      videoPlayerControllerList[i] = newController;
      alreadyListened.remove(i);
      await oldController.dispose();
      refreshView();
    }
  }

  void refreshView() {
    loading.value = true;
    loading.value = false;
  }

  void cacheVideo(int index) {
    if (!isCaching) return;
    String url = videoList[index].url;
    if (caching.contains(url)) return;
    caching.add(url);
    log('Video being cached through proxy: $index');
  }

  void listenEvents(int index, {bool force = false}) {
    if (alreadyListened.contains(index) && !force) return;

    alreadyListened.add(index);
    var controller = videoPlayerControllerList[index];

    controller.addListener(() {
      if (controller.value.position == controller.value.duration &&
          controller.value.duration != Duration.zero) {
        controller.seekTo(Duration.zero);
        controller.play();
      }
    });
  }

  void increasePage(int value) {
    if (pageCount.value == videoList.length) return;
    if (pageCount.value >= value) return;
    pageCount.value = value;
  }
}
