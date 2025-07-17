// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/loading.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/messages_requests/bloc/request_sender_bloc.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';

import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class StartChat extends StatefulWidget {
  const StartChat({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  State<StartChat> createState() => _StartChatState();
}

class _StartChatState extends State<StartChat> {
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      context.read<RequestSenderBloc>().add(
        CheckingUserAvailableEvent(
          senderId: FirebaseAuth.instance.currentUser!.uid,
          receiverId: widget.profileModel.id,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<RequestSenderBloc, RequestSenderState>(
      listener: _listener,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocSelector<RequestSenderBloc, RequestSenderState, Requestmodel?>(
            selector: (state) {
              if (state is CheckingUserAvailableState) return state.userData;
              return null;
            },
            builder: (context, data) {
              return PlatformIconButton(
                onPressed: () {
                  if (data == null) {
                    final state = getIt<ProfileBloc>().state as ProfileLoaded;
                    final currentUserData = state.data;
                    print("current user name ${currentUserData.pseudo}");
                    QuickAlert.show(
                      textAlignment: TextAlign.left,
                      widget: SizedBox.shrink(),
                      text:
                          "${EnumLocale.messageRequestsText1.name.tr} ${widget.profileModel.pseudo} ${EnumLocale.messageRequestsText2.name.tr} ",
                      headerBackgroundColor: AppColors.yellow,
                      backgroundColor: AppColors.floralWhite,
                      context: context,
                      confirmBtnText: EnumLocale.sendButtonText.name.tr,
                      cancelBtnText: EnumLocale.cancel.name.tr,
                      confirmBtnColor: AppColors.primaryColor,
                      showCancelBtn: true,
                      title: EnumLocale.sendRequest.name.tr,
                      type: QuickAlertType.info,
                      onCancelBtnTap: () {
                        print("message requests cancel !");
                        Get.back();
                      },
                      onConfirmBtnTap: () {
                        print("message requests send !");
                        context.read<RequestSenderBloc>().add(
                          RequestSenderSend(
                            senderId: FirebaseAuth.instance.currentUser!.uid,
                            senderName: currentUserData.pseudo,
                            senderProfile: currentUserData.imgURL,
                            receiverId: widget.profileModel.id,
                            receiverName: widget.profileModel.pseudo,
                            receiverProfile: widget.profileModel.imgURL,
                          ),
                        );
                        Get.back();
                      },
                    );
                  } else {
                    print("User Avaible !");
                    print(data.responseStatus.toString());
                    if (data.responseStatus.name ==
                        ResponseStatus.Initial.name) {
                      QuickAlert.show(
                        textAlignment: TextAlign.left,
                        widget: SizedBox.shrink(),
                        text:
                            "${widget.profileModel.pseudo} ${EnumLocale.requestInitialMessage.name.tr} ",
                        headerBackgroundColor: AppColors.yellow,
                        backgroundColor: AppColors.floralWhite,
                        context: context,
                        title: EnumLocale.requestInitial.name.tr,
                        type: QuickAlertType.info,
                        onConfirmBtnTap: () {
                          Get.back();
                        },
                      );
                    } else if (data.responseStatus.name ==
                        ResponseStatus.Accepted.name) {
                      Get.to(
                        () => ChatScreen(
                          imgURL: widget.profileModel.imgURL,
                          receiverId: widget.profileModel.id,
                          receiverName: widget.profileModel.pseudo,
                        ),
                      );
                    }
                  }
                },
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.black,
                  size: 30,
                ),
              );
            },
          ),
          PlatformText(
            EnumLocale.message.name.tr,
            style:
                theme // context is still fine for Theme.of
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }

  void _listener(context, state) {
    if (state is RequestsLoading) {
      customLoading(context);
    }
    if (state is ErrorInRequests) {
      Get.back();
      snackBarMessage(context, state.errorMessage, Theme.of(context));
    }
    if (state is RequestSendSuccessfully) {
      Get.back();
      snackBarMessage(
        context,
        "${EnumLocale.messageRequestsSend1.name.tr} ${widget.profileModel.pseudo} ${EnumLocale.messageRequestsSend2.name.tr} ",
        Theme.of(context),
      );
    }
  }
}
