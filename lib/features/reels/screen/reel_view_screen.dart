import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/features/reels/widget/reels_screen_widget.dart';
import 'package:timirama/features/reels/widget/shimmer_effect.dart';
import 'package:video_player/video_player.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  late PageController _pageController;
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, StreamController<double>> _progressControllers = {};
  final Map<int, StreamController<double>> _bufferControllers = {};
  int _currentIndex = 0;

  // Limit concurrent video controllers to prevent memory issues
  static const int _maxConcurrentControllers = 3;
  final List<int> _activeControllerIndices = [];

  // Track manually paused videos
  final Set<int> _manuallyPausedVideos = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Ensure auto-play of first video when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Small delay to ensure the page is fully loaded
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _autoPlayFirstVideo();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _disposeAllControllers();
    super.dispose();
  }

  void _disposeAllControllers() {
    for (var controller in _videoControllers.values) {
      try {
        controller.dispose();
      } catch (e) {
        debugPrint('Error disposing video controller: $e');
      }
    }

    for (var controller in _progressControllers.values) {
      try {
        controller.close();
      } catch (e) {
        debugPrint('Error closing progress controller: $e');
      }
    }

    for (var controller in _bufferControllers.values) {
      try {
        controller.close();
      } catch (e) {
        debugPrint('Error closing buffer controller: $e');
      }
    }

    _videoControllers.clear();
    _progressControllers.clear();
    _bufferControllers.clear();
    _activeControllerIndices.clear();
    _manuallyPausedVideos.clear();
  }

  void _cleanupInactiveControllers() {
    // Remove controllers that are far from current index
    final indicesToRemove = <int>[];

    for (final index in _videoControllers.keys) {
      if ((index - _currentIndex).abs() > _maxConcurrentControllers) {
        indicesToRemove.add(index);
      }
    }

    for (final index in indicesToRemove) {
      _disposeControllerAtIndex(index);
    }
  }

  void _disposeControllerAtIndex(int index) {
    try {
      final videoController = _videoControllers[index];
      if (videoController != null) {
        videoController.pause();
        videoController.dispose();
        _videoControllers.remove(index);
      }

      final progressController = _progressControllers[index];
      if (progressController != null) {
        progressController.close();
        _progressControllers.remove(index);
      }

      final bufferController = _bufferControllers[index];
      if (bufferController != null) {
        bufferController.close();
        _bufferControllers.remove(index);
      }

      _activeControllerIndices.remove(index);
      _manuallyPausedVideos.remove(index);
    } catch (e) {
      debugPrint('Error disposing controller at index $index: $e');
    }
  }

  void _initializeVideoController(int index, String videoUrl) {
    if (_videoControllers.containsKey(index)) return;

    // Clean up inactive controllers before creating new ones
    _cleanupInactiveControllers();

    try {
      final controller = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ),
      );

      final progressController = StreamController<double>.broadcast();
      final bufferController = StreamController<double>.broadcast();

      _videoControllers[index] = controller;
      _progressControllers[index] = progressController;
      _bufferControllers[index] = bufferController;
      _activeControllerIndices.add(index);

      controller.initialize().then((_) {
        if (mounted && _videoControllers.containsKey(index)) {
          setState(() {});
          _setupVideoListener(
              index, controller, progressController, bufferController);

          // Auto-play if this is the current index
          if (index == _currentIndex) {
            controller.play();
          }

          // Auto-play the first video when entering the reels page
          if (index == 0 && _currentIndex == 0) {
            _autoPlayFirstVideo();
          }
        }
      }).catchError((error) {
        debugPrint(
            'Error initializing video controller at index $index: $error');
        _disposeControllerAtIndex(index);
      });
    } catch (e) {
      debugPrint('Error creating video controller at index $index: $e');
    }
  }

  void _setupVideoListener(
    int index,
    VideoPlayerController controller,
    StreamController<double> progressController,
    StreamController<double> bufferController,
  ) {
    controller.addListener(() {
      if (!mounted || !_videoControllers.containsKey(index)) return;

      try {
        if (!controller.value.isInitialized) return;

        final duration = controller.value.duration;
        if (duration.inMilliseconds == 0) return;

        // Check if video has ended and restart it for looping
        if (controller.value.position.inMilliseconds >=
            duration.inMilliseconds - 100) {
          // Video has ended (with 100ms tolerance), restart it
          controller.seekTo(Duration.zero);
          controller.play();
        }

        // Playback progress
        final progress =
            controller.value.position.inMilliseconds / duration.inMilliseconds;
        if (!progressController.isClosed) {
          progressController.add(progress);
        }

        // Buffer progress
        if (controller.value.buffered.isNotEmpty) {
          final bufferProgress =
              controller.value.buffered.last.end.inMilliseconds /
                  duration.inMilliseconds;
          if (!bufferController.isClosed) {
            bufferController.add(bufferProgress);
          }
        }
      } catch (e) {
        debugPrint('Error in video listener at index $index: $e');
      }
    });
  }

  void _onPageChanged(int index) {
    if (!mounted) return;

    try {
      // Pause previous video
      if (_currentIndex != index &&
          _videoControllers.containsKey(_currentIndex)) {
        final previousController = _videoControllers[_currentIndex];
        if (previousController != null && previousController.value.isPlaying) {
          previousController.pause();
          // Don't mark as manually paused during transitions
        }
      }

      _currentIndex = index;

      // Play current video with auto-play (unless manually paused)
      if (_videoControllers.containsKey(index)) {
        final currentController = _videoControllers[index];
        if (currentController != null &&
            currentController.value.isInitialized &&
            !_manuallyPausedVideos.contains(index)) {
          currentController.play();
        }
      }

      // Preload next few videos
      _preloadNearbyVideos(index);
    } catch (e) {
      debugPrint('Error in page change: $e');
    }
  }

  // Auto-play the first video when entering the reels page
  void _autoPlayFirstVideo() {
    if (_videoControllers.containsKey(0) &&
        !_manuallyPausedVideos.contains(0)) {
      final firstController = _videoControllers[0];
      if (firstController != null && firstController.value.isInitialized) {
        firstController.play();
      }
    }
  }

  void _preloadNearbyVideos(int currentIndex) {
    // Preload videos within range
    for (int i = currentIndex - 1; i <= currentIndex + 1; i++) {
      if (i >= 0 && i < _getReelCount() && !_videoControllers.containsKey(i)) {
        // This will be handled by the PageView.builder
      }
    }
  }

  int _getReelCount() {
    // Get reel count from bloc state
    final reelBloc = context.read<ReelBloc>();
    if (reelBloc.state is Initial) {
      return (reelBloc.state as Initial).reelModel.length;
    }
    return 0;
  }

  bool _shouldShowPlayPauseIcon(int index) {
    // Only show play icon if video is paused AND was manually paused by user
    return _videoControllers.containsKey(index) &&
        _videoControllers[index]!.value.isInitialized &&
        !_videoControllers[index]!.value.isPlaying &&
        _manuallyPausedVideos.contains(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ReelBloc, ReelState, List<ReelModel>>(
      selector: (state) {
        if (state is Initial) {
          return state.reelModel;
        }
        return [];
      },
      builder: (context, reelData) {
        if (reelData.isEmpty) {
          return const Center(
            child: Text(
              "No reels available",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: _onPageChanged,
          itemCount: reelData.length,
          itemBuilder: (context, index) {
            final reel = reelData[index];

            // Initialize video controller for this index
            _initializeVideoController(index, reel.reelUrl);

            return _buildReelItem(index, reel);
          },
        );
      },
    );
  }

  Widget _buildReelItem(int index, ReelModel reel) {
    final videoController = _videoControllers[index];
    final progressController = _progressControllers[index];
    final bufferController = _bufferControllers[index];

    if (videoController == null || !videoController.value.isInitialized) {
      return const ReelShimmerLoader();
    }

    return Stack(
      children: [
        // Video player
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: videoController.value.size.width,
              height: videoController.value.size.height,
              child: VideoPlayer(videoController),
            ),
          ),
        ),

        // Play/Pause overlay
        GestureDetector(
          onTap: () {
            try {
              if (videoController.value.isPlaying) {
                videoController.pause();
                _manuallyPausedVideos.add(index);
              } else {
                videoController.play();
                _manuallyPausedVideos.remove(index);
              }
              setState(() {});
            } catch (e) {
              debugPrint('Error toggling video playback: $e');
            }
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: AnimatedOpacity(
                opacity: _shouldShowPlayPauseIcon(index) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Reel description overlay
        ReelDescription(reelData: reel),

        // Action widgets overlay
        VirticalActionWidgets(reelData: reel),

        // Buffer slider
        if (bufferController != null && !bufferController.isClosed)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: StreamBuilder<double>(
              stream: bufferController.stream,
              builder: (_, snapshot) => SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: SliderComponentShape.noThumb,
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 2,
                ),
                child: Slider(
                  value: (snapshot.data ?? 0).clamp(0.0, 1.0),
                  onChanged: (_) {},
                  min: 0,
                  max: 1,
                  activeColor: Colors.grey,
                  inactiveColor: AppColors.white,
                ),
              ),
            ),
          ),

        // Playback slider
        if (progressController != null && !progressController.isClosed)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: StreamBuilder<double>(
              stream: progressController.stream,
              builder: (_, snapshot) => SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: SliderComponentShape.noThumb,
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 2,
                ),
                child: Slider(
                  value: (snapshot.data ?? 0).clamp(0.0, 1.0),
                  min: 0,
                  max: 1,
                  activeColor: AppColors.floralWhite,
                  inactiveColor: Colors.transparent,
                  onChanged: (value) {
                    try {
                      final duration = videoController.value.duration;
                      if (duration.inMilliseconds > 0) {
                        final newPosition = duration * value;
                        videoController.seekTo(newPosition);
                      }
                    } catch (e) {
                      debugPrint('Error seeking video: $e');
                    }
                  },
                  onChangeEnd: (_) {
                    try {
                      videoController.play();
                    } catch (e) {
                      debugPrint('Error resuming video: $e');
                    }
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
