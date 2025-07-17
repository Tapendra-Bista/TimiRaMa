import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:voice_message_package/voice_message_package.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  // final bool showTime;
  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,

    // required this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onLongPress: () => isMe
              ? showDialog(
                  context: context,
                  barrierColor: Colors.transparent.withValues(alpha: 0.1),
                  builder: (BuildContext context) {
                    // Specify the type of context
                    return AlertDialog(
                      backgroundColor: AppColors.floralWhite,
                      title: Center(
                        child: Text(
                          EnumLocale.areYouSure.name.tr,
                          style: theme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 30.h,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Uri.tryParse(message.content)!.hasAbsolutePath == true
                              ? Row(
                                  spacing: 5.w,
                                  children: [
                                    Icon(
                                      Icons.mic_outlined,
                                      color: AppColors.grey,
                                    ),
                                    Text(
                                      EnumLocale.voiceMessage.name.tr,
                                      style: theme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              : Text(
                                  "\"${message.content}\"",
                                  style: theme.bodySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlatformTextButton(
                                color: AppColors.greyContainerColor,
                                onPressed: () => Get.back(),
                                child: Text(
                                  EnumLocale.cancel.name.tr,
                                  style: theme.bodySmall!.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              PlatformTextButton(
                                color: AppColors.red,
                                onPressed: () {
                                  context.read<ChatBloc>().add(
                                    DeleteMessage(
                                      chatRoomId: message.chatRoomId,
                                      content: message.content,
                                      timestamp: message.timestamp,
                                    ),
                                  );
                                  Get.back();
                                },
                                child: Text(
                                  EnumLocale.deleteChat.name.tr,
                                  style: theme.bodySmall!.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    );
                  },
                )
              : null,
          child: message.type == MessageType.text
              ? BubbleSpecialOne(
                  text: "${message.content}",
                  isSender: isMe,
                  tail: true,
                  textStyle: theme.bodyMedium!.copyWith(color: AppColors.white),
                  color: isMe
                      ? AppColors.primaryColor.withValues(alpha: 0.8)
                      : AppColors.black.withValues(alpha: 0.72),
                  sent: message.status == MessageStatus.sent ? true : false,
                  seen: message.status == MessageStatus.read ? true : false,
                )
              : Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: VoiceMessageView(
                    activeSliderColor: isMe
                        ? AppColors.primaryColor.withValues(alpha: 0.8)
                        : AppColors.black.withValues(alpha: 0.72),
                    circlesColor: isMe
                        ? AppColors.primaryColor.withValues(alpha: 0.8)
                        : AppColors.black.withValues(alpha: 0.72),
                    controller: VoiceController(
                      audioSrc: message.content,
                      maxDuration: Duration(minutes: 5),
                      isFile: false,
                      onComplete: () {},
                      onPause: () {},
                      onPlaying: () {},
                    ),
                    innerPadding: 12,
                    cornerRadius: 20,
                  ),
                ),
        ),
        BubbleSpecialOne(
          text: DateFormat('h:mm a').format(message.timestamp.toDate()),
          isSender: isMe,
          textStyle: theme.bodySmall!.copyWith(
            color: AppColors.black,
            fontSize: 11.sp,
          ),
          color: AppColors.floralWhite,
        ),
      ],
    );
  }
}
