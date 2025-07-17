import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/common/widgets/linear_indicator.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:timirama/features/chat/bloc/chat_state.dart';
import 'package:timirama/features/chat/widgets/list_of_users.dart';
import 'package:timirama/features/chat/widgets/no_chats.dart';
import 'package:timirama/features/messages_requests/bloc/request_receiver_bloc.dart';

import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:badges/badges.dart' as Badges;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatRoomsScreen extends StatefulWidget {
  const ChatRoomsScreen({super.key});

  @override
  State<ChatRoomsScreen> createState() => _ChatRoomsScreenState();
}

class _ChatRoomsScreenState extends State<ChatRoomsScreen> {
  final String _currentUserId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    context.read<RequestReceiverBloc>().add(RequestReceiverUnreadCount());
    super.initState();
  }

  //------------Chat RoOM MAIN screen---------------------
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        title: Text(EnumLocale.chats.name.tr),
        trailingActions: [
          BlocSelector<RequestReceiverBloc, RequestReceiverState, int?>(
            selector: (state) {
              if (state is GetUnreadCount) return state.count;
              return 0;
            },
            builder: (context, count) {
              return Badges.Badge(
                showBadge: count! > 0 ? true : false,
                badgeStyle: Badges.BadgeStyle(
                  shape: Badges.BadgeShape.circle,
                  badgeColor: AppColors.primaryColor,
                ),
                position: Badges.BadgePosition.topStart(),
                badgeContent: Text(
                  count.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: theme.bodySmall!.copyWith(
                    color: AppColors.floralWhite,
                    fontSize: 10.sp,
                  ),
                ),
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.requests),
                  child: Text(
                    EnumLocale.requests.name.tr,
                    style: theme.bodyMedium!.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: BlocSelector<ChatBloc, ChatState, bool>(
            selector: (state) => state.isDelete!,
            builder: (context, isDeleting) {
              return isDeleting ? CustomLinearIndicator() : SizedBox.shrink();
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.floralWhite,
        onRefresh: () async {
          getIt<ChatBloc>().add(ChatRoomsLists(id: _currentUserId));
        },
        child: BlocBuilder<ChatBloc, ChatState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, state) {
            return switch (state) {
              //-------initial state-----------------
              ChatLoading() => CustomCircularIndicator(),
              //--------------- Except above condition--------
              ChatEmpty() => NoChats(),
              _ => ListOfUsers(),
            };
          },
        ),
      ),
    );
  }
}
