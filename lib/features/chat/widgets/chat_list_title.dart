import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_event.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:timirama/features/chat/repository/chat_repository.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

// Chat List Title 
class ChatListTile extends StatelessWidget {
  final ChatRoomModel chat;
  final String currentUserId;
  final VoidCallback onTap;
  final String otherUserId;

  ChatListTile({
    super.key,
    required this.chat,
    required this.currentUserId,
    required this.otherUserId,
    required this.onTap,
  });

  String _getOtherUsername(context) {
    try {
      final otherUserId = chat.participants.firstWhere(
        (id) => id != currentUserId,
        orElse: () => 'Unknown User',
      );
      return chat.participantsName?[otherUserId]!['pseudo'] ?? "Unknown User";
    } catch (e) {
      return "Unknown User";
    }
  }

  String _getOtherUserimage() {
    try {
      final otherUserId = chat.participants.firstWhere(
        (id) => id != currentUserId,
        orElse: () => 'Unknown User',
      );
      return chat.participantsName?[otherUserId]!['imgURL'] ?? "";
    } catch (e) {
      return "Unknown User";
    }
  }

  String _getUserID() {
    return chat.participants.firstWhere(
      (id) => id != currentUserId,
      orElse: () => 'Unknown User',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isValideUrl = _getOtherUserimage().isNotEmpty &&
        Uri.tryParse(_getOtherUserimage())!.hasAbsolutePath == true;
    return Slidable(
      dragStartBehavior: DragStartBehavior.start,
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            foregroundColor: AppColors.white,
            label: EnumLocale.block.name.tr,
            backgroundColor: AppColors.grey,
            icon: HugeIcons.strokeRoundedUserBlock01,
            onPressed: (context) async {
              context.read<BlockBloc>().add(
                    BlockUserAdded(blockId: _getUserID()),
                  );

              context.read<HomeBloc>().add(HomeUsersProfileList());
              snackBarMessage(
                context,
                EnumLocale.refreshToUpdatedData.name.tr,
                Theme.of(context),
              );
            },
          ),
          SlidableAction(
            padding: EdgeInsets.only(left: 10.w),
            foregroundColor: AppColors.white,
            label: EnumLocale.deleteChatRoom.name.tr,
            backgroundColor: AppColors.red,
            icon: HugeIcons.strokeRoundedDelete01,
            onPressed: (contex) {
              context.read<ChatBloc>().add(
                    DeleteChatRoom(
                      currentUserId: currentUserId,
                      otherUserId: otherUserId,
                    ),
                  );
            },
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 25.5.r,
          backgroundImage: isValideUrl
              ? CachedNetworkImageProvider(_getOtherUserimage())
              : null,
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: 0.1),
        ),
        title: Text(
          _getOtherUsername(context),
          style: theme.bodyMedium!.copyWith(fontSize: 18),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            if (chat.lastMessage != null &&
                Uri.tryParse(chat.lastMessage!)!.hasAbsolutePath == true)
              Icon(Icons.mic_outlined, color: AppColors.grey),
            Expanded(
              child: Text(
                chat.lastMessage != null &&
                        Uri.tryParse(chat.lastMessage!)!.hasAbsolutePath == true
                    ? " ${EnumLocale.voiceMessage.name.tr}"
                    : chat.lastMessage ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                    ),
              ),
            ),
          ],
        ),
        trailing: StreamBuilder<int>(
          stream: getIt<ChatRepository>().getUnreadCount(
            chat.id,
            currentUserId,
          ),
          builder: (context, snapshot) {
            print("Unseen Count ${snapshot.data}");
            if (!snapshot.hasData || snapshot.data == 0) {
              return const SizedBox();
            }
            return Container(
              height: 15,
              width: 15,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  snapshot.data.toString(),
                  style: theme.bodySmall!.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.floralWhite,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
