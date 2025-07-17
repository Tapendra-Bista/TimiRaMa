import 'dart:io';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/linear_indicator.dart';
import 'package:timirama/features/add/screen/reel_details_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:video_trimmer/video_trimmer.dart';

class TrimVideo extends StatefulWidget {
  const TrimVideo({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<TrimVideo> createState() => _TrimVideoState();
}

class _TrimVideoState extends State<TrimVideo> {
  final Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  Future<String> saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String? _value;

    await _trimmer.saveTrimmedVideo(
      outputType: OutputType.video,
      startValue: _startValue,
      endValue: _endValue,
      onSave: (outputPath) => setState(() {
        _progressVisibility = false;
        _value = outputPath;
      }),
    );

    return _value!;
  }

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: File(widget.videoUrl));
  }

  @override
  void initState() {
    super.initState();

    _loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: PlatformIconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            HugeIcons.strokeRoundedMultiplicationSign,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15.h,
        children: [
          Visibility(
            visible: _progressVisibility,
            child: CustomLinearIndicator(),
          ),
          Padding(
            padding: EdgeInsets.all(18.w),
            child: Text(
              EnumLocale.lengthOfVideo.name.tr,
              style: theme.bodySmall,
            ),
          ),
          Expanded(child: VideoViewer(trimmer: _trimmer)),
          Center(
            child: TrimViewer(
              durationStyle: DurationStyle.FORMAT_HH_MM_SS,
              durationTextStyle: theme.bodyMedium!,
              trimmer: _trimmer,
              viewerHeight: 50.0,
              viewerWidth: MediaQuery.of(context).size.width,
              maxVideoLength: const Duration(seconds: 15),
              onChangeStart: (value) => _startValue = value,
              editorProperties: TrimEditorProperties(
                borderPaintColor: AppColors.blue,
              ),
              onChangeEnd: (value) => _endValue = value,
              onChangePlaybackState: (value) =>
                  setState(() => _isPlaying = value),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: _isPlaying
                    ? Icon(Icons.pause, size: 50.0, color: AppColors.black)
                    : Icon(
                        Icons.play_arrow,
                        size: 50.0,
                        color: AppColors.black,
                      ),
                onPressed: () async {
                  bool playbackState = await _trimmer.videoPlaybackControl(
                    startValue: _startValue,
                    endValue: _endValue,
                  );
                  setState(() {
                    _isPlaying = playbackState;
                  });
                },
              ),
              Center(
                child: SizedBox(
                  height:
                      40.h, // Slightly increased height for better touch target
                  width: 100.w,
                  child: PlatformElevatedButton(
                    // Using ElevatedButton for better default styling
                    onPressed: _progressVisibility
                        ? null
                        : () async {
                            final _value = await saveVideo();
                            print("Url :${_value}");
                            Get.to(
                              () => ReelDetailsCreate(
                                url: _value,
                                trimmer: _trimmer,
                              ),
                            );
                          },
                    material: (context, platform) => MaterialElevatedButtonData(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),

                    cupertino: (context, platform) =>
                        CupertinoElevatedButtonData(
                          color: Colors.transparent,
                          padding: EdgeInsets.zero,
                        ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: PlatformText(
                          EnumLocale.next.name.tr,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.white),
                        ),

                        // Show indicator if loading and it's the login button
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
