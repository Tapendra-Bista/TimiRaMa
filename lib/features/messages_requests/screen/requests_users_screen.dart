import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/messages_requests/bloc/request_receiver_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_sender_bloc.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';

class RequestsReceiverScreen extends StatelessWidget {
  const RequestsReceiverScreen({super.key});
  //Fetch data screen
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<RequestReceiverBloc, RequestReceiverState,
        List<Requestmodel>>(
      selector: (state) {
        if (state is GetRequests) return state.receiverData;
        return [];
      },
      builder: (context, data) {
        return ListView.builder(
          itemCount: data.length,
          reverse: false,
          itemBuilder: (context, index) {
            final user = data[index];
            final isValidPath = user.senderProfile.isNotEmpty &&
                Uri.tryParse(user.senderProfile)!.hasAbsolutePath == true;
            return Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: user.responseStatus.name ==
                          ResponseStatus.Accepted.name
                      ? [
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColors.blue,
                            foregroundColor: AppColors.white,
                            onPressed: (context) {},
                            label: EnumLocale.accepted.name.tr,
                          ),
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColors.greyContainerColor,
                            foregroundColor: AppColors.black,
                            onPressed: (context) {
                              Get.to(
                                () => ChatScreen(
                                  imgURL: user.senderProfile,
                                  receiverId: user.senderId,
                                  receiverName: user.senderName,
                                ),
                              );
                            },
                            label: EnumLocale.message.name.tr,
                            icon: CupertinoIcons.chat_bubble,
                          ),
                        ]
                      : [
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColors.blue,
                            foregroundColor: AppColors.white,
                            onPressed: (context) {
                              context.read<RequestReceiverBloc>().add(
                                    AcceptRequest(
                                      senderId: user.senderId,
                                      receiverId: user.receiverId,
                                    ),
                                  );

                              context.read<RequestReceiverBloc>().add(
                                    RequestReceiverGet(),
                                  );
                              snackBarMessage(
                                context,
                                "${EnumLocale.messageRequestAccepted.name.tr} ${user.senderName}",
                                Theme.of(context),
                              );
                            },
                            label: EnumLocale.accept.name.tr,
                            icon: Icons.check_circle,
                          ),
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColors.greyContainerColor,
                            foregroundColor: AppColors.black,
                            onPressed: (context) async {
                              context.read<ArchiveBloc>().add(
                                    ArchiveUserAdded(archiveId: user.senderId),
                                  );
                              snackBarMessage(
                                context,
                                EnumLocale.addedToArchive.name.tr,
                                Theme.of(context),
                              );
                            },
                            label: EnumLocale.archive.name.tr,
                            icon: HugeIcons.strokeRoundedArchive,
                          ),
                        ],
                ),
                dragStartBehavior: DragStartBehavior.down,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.black.withValues(alpha: 0.6),
                      width: 0.5.w,
                    ),
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25.5.r,
                    backgroundImage: isValidPath
                        ? CachedNetworkImageProvider(user.senderProfile)
                        : null,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.senderName,
                        style: theme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        DateFormat('h:mm a').format(user.createdAt.toDate()),
                        style: theme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "${user.senderName} ${EnumLocale.requestInfo.name.tr}",
                    style: theme.bodySmall!.copyWith(fontSize: 10.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: SizedBox(
                    height: 60.h,
                    width: 10.w,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class RequestsSenderScreen extends StatelessWidget {
  const RequestsSenderScreen({super.key});
  //Fetch data screen
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<RequestSenderBloc, RequestSenderState,
        List<Requestmodel>>(
      selector: (state) {
        if (state is TotalRequestSenderSendState) return state.senderData;
        return [];
      },
      builder: (context, data) {
        return ListView.builder(
          itemCount: data.length,
          reverse: false,
          itemBuilder: (context, index) {
            final user = data[index];
            final isValidPath = user.receiverProfile.isNotEmpty &&
                Uri.tryParse(user.receiverProfile)!.hasAbsolutePath == true;
            return Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children:
                      user.responseStatus.name == ResponseStatus.Accepted.name
                          ? [
                              SlidableAction(
                                padding: EdgeInsets.zero,
                                backgroundColor: AppColors.greyContainerColor,
                                foregroundColor: AppColors.black,
                                onPressed: (context) {
                                  Get.to(
                                    () => ChatScreen(
                                      imgURL: user.receiverProfile,
                                      receiverId: user.receiverId,
                                      receiverName: user.receiverName,
                                    ),
                                  );
                                },
                                label: EnumLocale.message.name.tr,
                                icon: CupertinoIcons.chat_bubble,
                              ),
                            ]
                          : [
                              SlidableAction(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15.h),
                                backgroundColor: AppColors.red,
                                foregroundColor: AppColors.white,
                                onPressed: (context) {
                                  context.read<RequestSenderBloc>().add(
                                        RequestSenderDelete(
                                          senderId: user.senderId,
                                          receiverId: user.receiverId,
                                        ),
                                      );

                                  context.read<RequestSenderBloc>().add(
                                        TotalRequestSenderSend(),
                                      );

                                  snackBarMessage(
                                    context,
                                    "${EnumLocale.messageRequestDelete.name.tr} ${user.receiverName}",
                                    Theme.of(context),
                                  );
                                },
                                label: EnumLocale.deleteChat.name.tr,
                                icon: Icons.delete_outline,
                              ),
                            ],
                ),
                dragStartBehavior: DragStartBehavior.down,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: user.responseStatus.name ==
                              ResponseStatus.Initial.name
                          ? AppColors.black.withValues(alpha: 0.6)
                          : AppColors.green,
                      width: 0.5.w,
                    ),
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 26.6.r,
                    backgroundImage: isValidPath
                        ? CachedNetworkImageProvider(user.receiverProfile)
                        : null,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.receiverName,
                        style: theme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        DateFormat('h:mm a').format(user.createdAt.toDate()),
                        style: theme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Request status: ",
                            style: theme.bodyMedium!.copyWith(fontSize: 12.sp),
                          ),
                          Text(
                            "${user.requestStatus.name}",
                            style: theme.bodySmall!.copyWith(
                              color: user.requestStatus.name ==
                                      RequestStatus.Send.name
                                  ? AppColors.black
                                  : AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Response status: ",
                            style: theme.bodyMedium!.copyWith(fontSize: 12.sp),
                          ),
                          Text(
                            "${user.responseStatus.name}",
                            style: theme.bodySmall!.copyWith(
                              color: user.responseStatus.name ==
                                      ResponseStatus.Initial.name
                                  ? AppColors.black
                                  : AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    height: 60.h,
                    width: 10.w,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
