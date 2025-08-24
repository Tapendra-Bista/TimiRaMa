import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_state.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/chat/widgets/chating_user_state.dart';
import 'package:timirama/features/chat/widgets/loading_dots.dart';

//ApppBar -
class ChatScreenAppBar extends StatelessWidget {
  const ChatScreenAppBar({
    super.key,
    required this.isValideUrl,
    required this.widget,
  });

  final bool isValideUrl;
  final ChatScreen widget;

  @override
  Widget build(BuildContext context) {
    return PlatformAppBar(
      material: (context, platform) {
        return MaterialAppBarData(titleSpacing: 0);
      },
      automaticallyImplyLeading: false,
      trailingActions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Icon(Icons.more_vert_outlined),
        ),
      ],
      leading: PlatformIconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(HugeIcons.strokeRoundedMultiplicationSign, size: 30.r),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 25.5.r,
            backgroundImage:
                isValideUrl ? CachedNetworkImageProvider(widget.imgURL) : null,
            backgroundColor: Theme.of(
              context,
            ).primaryColor.withValues(alpha: 0.1),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.receiverName,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
              BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state.isReceiverTyping) {
                    return Row(
                      children: [
                        LoadingDots(),
                        SizedBox(width: 2.w),
                        Text(
                          EnumLocale.typing.name.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(fontSize: 11),
                        ),
                      ],
                    );
                  } else {
                    return UserState();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
