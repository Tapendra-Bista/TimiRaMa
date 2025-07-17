import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/features/add/bloc/add_bloc.dart';
import 'package:timirama/features/add/screen/trim_video_screen.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

//--------------Add  Screen---------------
class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddBloc, AddState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        listener: (context, state) {
          if (state is ValidUrl) {
            Get.to(() => TrimVideo(videoUrl: state.videoUrl));
          }
        },
        builder: (context, state) {
          return CameraAwesomeBuilder.awesome(
            topActionsBuilder: (state) => Container(
              color: AppColors.black,
              child: AwesomeTopActions(
                state: state,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                children: [
                  PlatformIconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      HugeIcons.strokeRoundedMultiplicationSign,
                      color: AppColors.floralWhite,
                    ),
                  ),
                  Text(
                    EnumLocale.newReel.name.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.floralWhite,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  PlatformIconButton(
                    onPressed: () {},
                    icon: Icon(
                      HugeIcons.strokeRoundedSettings01,
                      color: AppColors.floralWhite,
                    ),
                  ),
                ],
              ),
            ),
            bottomActionsBuilder: (state) => AwesomeBottomActions(
              padding: EdgeInsets.symmetric(vertical: 30.w),
              state: state,
              left: AwesomeCameraSwitchButton(state: state, scale: 1),
              captureButton: SizedBox(
                height: 40,
                width: 40,
                child: AwesomeCaptureButton(state: state),
              ),
              right: IconButton.outlined(
                highlightColor: AppColors.grey,
                splashColor: AppColors.grey,
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(40, 40)),
                ),
                color: AppColors.grey,
                onPressed: () => context.read<AddBloc>().add(PickVideo()),
                icon: Icon(
                  Icons.collections_outlined,
                  color: AppColors.floralWhite,
                ),
              ),
            ),
            progressIndicator: const CustomCircularIndicator(),
            onMediaCaptureEvent: (mediaCapture) {
              if (mediaCapture.isVideo) {
                if (!mediaCapture.isRecordingVideo) {
                  mediaCapture.captureRequest.when(
                    single: (single) {
                      if (single.file?.path != null &&
                          single.file!.path.isNotEmpty) {
                        final url = single.file!.path;
                        context.read<AddBloc>().add(
                          RecordVideo(videoPath: url),
                        );
                      }
                    },
                  );
                }
              }
            },
            sensorConfig: SensorConfig.single(
              sensor: Sensor.position(SensorPosition.back),
              flashMode: FlashMode.auto,
              aspectRatio: CameraAspectRatios.ratio_16_9,
              zoom: 0.0,
            ),
            saveConfig: SaveConfig.video(
              videoOptions: VideoOptions(
                enableAudio: true,
                ios: CupertinoVideoOptions(fps: 30),
                android: AndroidVideoOptions(
                  bitrate: 6000000,
                  fallbackStrategy: QualityFallbackStrategy.lower,
                ),
              ),
              mirrorFrontCamera: true,
            ),
          );
        },
      ),
    );
  }
}
