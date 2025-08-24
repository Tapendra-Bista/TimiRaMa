import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

//-Voice Record
class VoiceRecord extends StatefulWidget {
  const VoiceRecord({
    super.key,
    required this.receiverId,
    required this.waveformRecorderController,
    required this.onCancel,
  });
  final String receiverId;
  final WaveformRecorderController waveformRecorderController;
  final VoidCallback onCancel;
  @override
  State<VoiceRecord> createState() => _VoiceRecordState();
}

class _VoiceRecordState extends State<VoiceRecord> {
  Future<void> _onRecordingStopped() async {
    final file = widget.waveformRecorderController.file;
    if (file == null) return;
    context.read<ChatBloc>().add(
          SendVoiceMessage(rawUrl: file.path, receiverId: widget.receiverId),
        );
    debugPrint('XFile properties:');
    debugPrint('  path: ${file.path}');

    debugPrint('  mimeType: ${file.mimeType}');
  }

  Future<void> _resumedOrPaused() async {
    try {
      if (widget.waveformRecorderController.isPaused) {
        await widget.waveformRecorderController.resumeRecording();
        print("Resumed record !");
      } else {
        await widget.waveformRecorderController.pauseRecording();
        print("Paused record !");
      }

      setState(() {});
    } catch (e) {
      print(("Error while  Resumed or Paused  record ${e.toString()}"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListenableBuilder(
      listenable: widget.waveformRecorderController,
      builder: (context, _) {
        return Container(
          width: 290.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.transparent,
            border: Border.all(color: AppColors.black, width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.w,
            children: [
              widget.waveformRecorderController.isRecording
                  ? SizedBox(
                      width: 150.w,
                      height: 50.h,
                      child: WaveformRecorder(
                        waveColor: AppColors.black.withValues(alpha: 0.5),
                        durationTextStyle: theme.bodyMedium!,
                        height: 50.h,
                        onRecordingStopped: _onRecordingStopped,
                        controller: widget.waveformRecorderController,
                      ),
                    )
                  : const SizedBox.shrink(),
              IconButton(
                onPressed: widget.onCancel,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.grey),
                ),
                icon: Icon(Icons.delete_outlined, color: AppColors.floralWhite),
              ),
              IconButton(
                onPressed: _resumedOrPaused,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.red),
                ),
                icon: Icon(
                  widget.waveformRecorderController.isPaused
                      ? Icons.mic_outlined
                      : Icons.pause_outlined,
                  color: AppColors.floralWhite,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
