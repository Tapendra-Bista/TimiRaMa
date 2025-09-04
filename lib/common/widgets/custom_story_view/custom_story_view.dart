import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timirama/common/utils/image_cache_manager.dart';
import 'package:timirama/common/utils/memory_manager.dart';

import 'story_item.dart';

class CustomStoryView extends StatefulWidget {
  final List<StoryItem> storyItems;
  final VoidCallback? onComplete;
  final Function(int?)? onPageChanged;
  final Color? indicatorColor;
  final Color? indicatorValueColor;
  final double? indicatorHeight;
  final EdgeInsetsGeometry? indicatorPadding;
  final bool showReplyButton;

  const CustomStoryView({
    Key? key,
    required this.storyItems,
    this.onComplete,
    this.onPageChanged,
    this.indicatorColor,
    this.indicatorValueColor,
    this.indicatorHeight,
    this.indicatorPadding,
    this.showReplyButton = true,
  }) : super(key: key);

  @override
  State<CustomStoryView> createState() => _CustomStoryViewState();
}

class _CustomStoryViewState extends State<CustomStoryView>
    with TickerProviderStateMixin {
  PageController? _pageController;
  int _currentIndex = 0;
  Timer? _timer;
  List<AnimationController> _animationControllers = [];
  List<Animation<double>> _animations = [];
  VoidCallback? _currentAnimationListener;
  final MemoryManager _memoryManager = MemoryManager();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _initializeAnimations();
    // Delay starting the story to ensure the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.storyItems.isNotEmpty) {
        _startStory();
      }
    });
  }

  void _initializeAnimations() {
    _animationControllers.clear();
    _animations.clear();

    for (int i = 0; i < widget.storyItems.length; i++) {
      final controller = AnimationController(
        duration: Duration(seconds: widget.storyItems[i].duration),
        vsync: this,
      );
      _animationControllers.add(controller);
      _animations.add(Tween<double>(begin: 0.0, end: 1.0).animate(controller));

      // Register controller with memory manager
      _memoryManager.registerController('story_animation_$i');
    }
  }

  void _startStory() {
    if (_currentIndex < widget.storyItems.length) {
      // Reset the current animation controller before starting
      _animationControllers[_currentIndex].reset();

      // Remove any existing listener
      if (_currentAnimationListener != null) {
        _animationControllers[_currentIndex]
            .removeListener(_currentAnimationListener!);
      }

      // Add listener to update UI during animation progress
      _currentAnimationListener = () {
        if (mounted) {
          setState(() {});
        }
      };
      _animationControllers[_currentIndex]
          .addListener(_currentAnimationListener!);

      // Start the animation
      _animationControllers[_currentIndex].forward();

      // Set up a listener to complete the story when animation completes
      _animationControllers[_currentIndex]
          .addStatusListener(_onAnimationStatusChanged);
    }
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && mounted) {
      // Safely remove listeners only if the controller still exists
      if (_currentIndex < _animationControllers.length) {
        _animationControllers[_currentIndex]
            .removeStatusListener(_onAnimationStatusChanged);
        // Remove the progress listener as well
        if (_currentAnimationListener != null) {
          _animationControllers[_currentIndex]
              .removeListener(_currentAnimationListener!);
          _currentAnimationListener = null;
        }
      }
      _nextStory();
    }
  }

  void _nextStory() {
    if (_currentIndex < widget.storyItems.length - 1) {
      // Cancel any existing timer
      _timer?.cancel();
      _memoryManager.cancelTimer('story_timer');

      setState(() {
        _currentIndex++;
      });
      _pageController?.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onPageChanged?.call(_currentIndex);
      _startStory();
    } else {
      widget.onComplete?.call();
    }
  }

  void _previousStory() {
    if (_currentIndex > 0 && mounted) {
      // Stop current animation and cancel timer
      if (_currentIndex < _animationControllers.length) {
        _animationControllers[_currentIndex].stop();
        _animationControllers[_currentIndex].reset();
        // Remove listeners from current animation
        _animationControllers[_currentIndex]
            .removeStatusListener(_onAnimationStatusChanged);
        if (_currentAnimationListener != null) {
          _animationControllers[_currentIndex]
              .removeListener(_currentAnimationListener!);
          _currentAnimationListener = null;
        }
      }
      _timer?.cancel();
      _memoryManager.cancelTimer('story_timer');

      setState(() {
        _currentIndex--;
      });
      _pageController?.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onPageChanged?.call(_currentIndex);
      _startStory();
    }
  }

  void _pauseStory() {
    _timer?.cancel();
    if (_currentIndex < _animationControllers.length && mounted) {
      _animationControllers[_currentIndex].stop();
    }
  }

  void _resumeStory() {
    // Resume the animation from where it was paused
    if (_currentIndex < _animationControllers.length && mounted) {
      _animationControllers[_currentIndex].forward();
    }
  }

  @override
  void dispose() {
    // Use memory manager to clean up all story-related resources
    _memoryManager.cancelTimersWithPrefix('story_');
    for (int i = 0; i < _animationControllers.length; i++) {
      _memoryManager.removeController('story_animation_$i');
    }

    // Cancel timer and clear reference
    _timer?.cancel();
    _timer = null;

    // Dispose page controller
    _pageController?.dispose();
    _pageController = null;

    // Clean up current animation listener
    if (_currentAnimationListener != null &&
        _currentIndex < _animationControllers.length) {
      _animationControllers[_currentIndex]
          .removeListener(_currentAnimationListener!);
      _currentAnimationListener = null;
    }

    // Properly dispose all animation controllers and remove all listeners
    for (var controller in _animationControllers) {
      // Remove all status listeners
      controller.removeStatusListener(_onAnimationStatusChanged);
      // Remove any remaining listeners
      if (_currentAnimationListener != null) {
        controller.removeListener(_currentAnimationListener!);
      }
      // Dispose the controller
      controller.dispose();
    }

    // Clear collections to prevent memory leaks
    _animationControllers.clear();
    _animations.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Story content
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.storyItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              widget.onPageChanged?.call(index);
            },
            itemBuilder: (context, index) {
              final storyItem = widget.storyItems[index];
              return GestureDetector(
                onTapDown: (details) {
                  _pauseStory();
                },
                onTapUp: (details) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final tapPosition = details.globalPosition.dx;

                  if (tapPosition < screenWidth / 3) {
                    _previousStory();
                  } else if (tapPosition > screenWidth * 2 / 3) {
                    _nextStory();
                  } else {
                    _resumeStory();
                  }
                },
                onTapCancel: () {
                  _resumeStory();
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: _buildStoryContent(storyItem),
                ),
              );
            },
          ),

          // Progress indicators
          Positioned(
            top: MediaQuery.of(context).padding.top +
                (widget.indicatorPadding?.resolve(TextDirection.ltr).top ?? 10),
            left: 8,
            right: 8,
            child: Row(
              children: List.generate(
                widget.storyItems.length,
                (index) => Expanded(
                  child: Container(
                    height: widget.indicatorHeight ?? 2,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: LinearProgressIndicator(
                      value: index < _currentIndex
                          ? 1.0
                          : index == _currentIndex
                              ? _animations[index].value
                              : 0.0,
                      backgroundColor:
                          widget.indicatorColor ?? Colors.grey[500],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.indicatorValueColor ?? Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryContent(StoryItem storyItem) {
    switch (storyItem.type) {
      case StoryItemType.image:
        return CachedNetworkImageExtension.story(
          imageUrl: storyItem.url,
          fit: BoxFit.cover,
          placeholder: Container(
            color: Colors.black,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
          errorWidget: Container(
            color: Colors.black,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.white, size: 50),
                  SizedBox(height: 8),
                  Text(
                    'Failed to load image',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        );
      case StoryItemType.video:
        // For now, just show a placeholder for video
        // You can implement video player here if needed
        return Container(
          color: Colors.grey[800],
          child: const Center(
            child:
                Icon(Icons.play_circle_outline, color: Colors.white, size: 80),
          ),
        );
    }
  }
}
