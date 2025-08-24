import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/reels/widget/shimmer_effect.dart';

import 'package:whitecodel_reels/models/video_model.dart';
import 'package:whitecodel_reels/whitecodel_reels.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/features/reels/widget/reels_screen_widget.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
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
        //  Show empty state instead of crashing
        if (reelData.isEmpty) {
          return const Center(
            child: Text(
              "No reels available",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return WhiteCodelReels(
          loader: ReelShimmerLoader(),
          videoList: reelData
              .map((item) => VideoModel(url: item.reelUrl))
              .toList(),
          context: context,
          builder:
              (context, index, child, videoPlayerController, pageController) {
            final videoProgressController = StreamController<double>();
            final videoBufferController = StreamController<double>();

            videoPlayerController.addListener(() {
              //  Skip if controller not ready
              if (!videoPlayerController.value.isInitialized) return;

              final duration = videoPlayerController.value.duration;
              if (duration.inMilliseconds == 0) return;

              // Playback progress
              final progress = videoPlayerController.value.position.inMilliseconds /
                  duration.inMilliseconds;
              videoProgressController.add(progress);

              // Buffer progress
              final bufferProgress = videoPlayerController.value.buffered.isNotEmpty
                  ? videoPlayerController.value.buffered.last.end.inMilliseconds /
                      duration.inMilliseconds
                  : 0.0;
              videoBufferController.add(bufferProgress);
            });

            return Stack(
              children: [
                child,

                //  Overlay reel description
                ReelDescription(reelData: reelData[index]),

                //  Overlay action widgets
                VirticalActionWidgets(reelData: reelData[index]),

                //  Buffer slider
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: StreamBuilder<double>(
                    stream: videoBufferController.stream,
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

                //  Playback slider
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: StreamBuilder<double>(
                    stream: videoProgressController.stream,
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
                          final duration =
                              videoPlayerController.value.duration;
                          if (duration.inMilliseconds > 0) {
                            final newPosition = duration * value;
                            videoPlayerController.seekTo(newPosition);
                          }
                        },
                        onChangeEnd: (_) {
                          videoPlayerController.play();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
