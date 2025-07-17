import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/model/video_model.dart';
import 'package:reels/reels.dart';
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
        ;

        return [];
      },
      builder: (context, reelData) {
        return Reels(
          videoList: reelData
              .map((item) => VideoModel(url: item.reelUrl))
              .toList(),
          isCaching: true,
          context: context,
          builder:
              (context, index, child, videoPlayerController, pageController) {
                StreamController<double> videoProgressController =
                    StreamController<double>();
                StreamController<double> videoPlayerBufferController =
                    StreamController<double>();

                videoPlayerController.addListener(() {
                  double videoProgress =
                      videoPlayerController.value.position.inMilliseconds /
                      videoPlayerController.value.duration.inMilliseconds;
                  videoProgressController.add(videoProgress);
                  double videoBufferProgress =
                      videoPlayerController.value.buffered.isNotEmpty
                      ? videoPlayerController
                                .value
                                .buffered
                                .last
                                .end
                                .inMilliseconds /
                            videoPlayerController.value.duration.inMilliseconds
                      : 0.0;
                  videoPlayerBufferController.add(videoBufferProgress);
                });
                return Stack(
                  children: [
                    child,
                    ReelDescription(reelData: reelData[index]),
                    VirticalActionWidgets(reelData: reelData[index]),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: StreamBuilder<double>(
                        stream: videoPlayerBufferController.stream,
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
                              final newPosition =
                                  videoPlayerController.value.duration * value;
                              videoPlayerController.seekTo(newPosition);
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
