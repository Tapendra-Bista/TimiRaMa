import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels/model/video_model.dart';
import 'package:reels/reels_controller.dart';
import 'package:reels/shimmer/shimmer_effect.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Reels extends StatefulWidget {
  final BuildContext context;
  final List<VideoModel>? videoList;
  final bool isCaching;
  final int startIndex;

  final Widget Function(
    BuildContext context,
    int index,
    Widget child,
    VideoPlayerController videoPlayerController,
    PageController pageController,
  )?
  builder;

  const Reels({
    super.key,
    required this.context,
    this.videoList,
    this.isCaching = false,
    this.builder,
    this.startIndex = 0,
  });

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  late ReelsController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(
      ReelsController(
        reelsVideoList: widget.videoList ?? [],
        isCaching: widget.isCaching,
        startIndex: widget.startIndex,
      ),
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<ReelsController>()) {
      Get.delete<ReelsController>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (!controller.isFirstVideoReady) {
          return const ReelShimmerLoader();
        }

        return PageView.builder(
          controller: controller.pageController,
          itemCount: controller.pageCount.value,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return buildTile(index);
          },
        );
      }),
    );
  }

  VisibilityDetector buildTile(int index) {
    return VisibilityDetector(
      key: Key(index.toString()),
      onVisibilityChanged: (visibilityInfo) {
        if (!mounted || controller.isClosed) return;

        if (visibilityInfo.visibleFraction < 0.5) {
          controller.videoPlayerControllerList[index].seekTo(Duration.zero);
          controller.videoPlayerControllerList[index].pause();
          controller.refreshView();

          //  safe guard
          if (!controller.isClosed &&
              controller.animationController.isAnimating) {
            controller.animationController.stop();
          }
        } else {
          controller.listenEvents(index);
          controller.videoPlayerControllerList[index].play();
          controller.refreshView();

          //  safe guard
          if (!controller.isClosed &&
              !controller.animationController.isAnimating) {
            controller.animationController.repeat();
          }

          controller.initNearByVideos(index);

          if (!controller.caching.contains(controller.videoList[index].url)) {
            controller.cacheVideo(index);
          }

          controller.visible.value = false;
        }
      },
      child: GestureDetector(
        onTap: () {
          if (!mounted || controller.isClosed) return;

          if (controller.videoPlayerControllerList[index].value.isPlaying) {
            controller.videoPlayerControllerList[index].pause();
            controller.visible.value = true;
            controller.refreshView();

            if (!controller.isClosed &&
                controller.animationController.isAnimating) {
              controller.animationController.stop();
            }
          } else {
            controller.videoPlayerControllerList[index].play();
            controller.visible.value = true;

            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted && !controller.isClosed) {
                controller.visible.value = false;
              }
            });

            controller.refreshView();

            if (!controller.isClosed &&
                !controller.animationController.isAnimating) {
              controller.animationController.repeat();
            }
          }
        },
        child: Obx(() {
          if (controller.loading.value ||
              !controller
                  .videoPlayerControllerList[index]
                  .value
                  .isInitialized) {
            return const ReelShimmerLoader();
          }

          return widget.builder == null
              ? VideoFullScreenPage(
                  videoPlayerController:
                      controller.videoPlayerControllerList[index],
                )
              : widget.builder!(
                  context,
                  index,
                  VideoFullScreenPage(
                    videoPlayerController:
                        controller.videoPlayerControllerList[index],
                  ),
                  controller.videoPlayerControllerList[index],
                  controller.pageController,
                );
        }),
      ),
    );
  }
}

class VideoFullScreenPage extends StatelessWidget {
  final VideoPlayerController videoPlayerController;

  const VideoFullScreenPage({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReelsController>();
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.height *
                  videoPlayerController.value.aspectRatio,
              height: MediaQuery.of(context).size.height,
              child: VideoPlayer(videoPlayerController),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Obx(
              () => Opacity(
                opacity: .5,
                child: AnimatedOpacity(
                  opacity: controller.visible.value ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: videoPlayerController.value.isPlaying
                        ? const Icon(Icons.pause, color: Colors.white, size: 40)
                        : const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
