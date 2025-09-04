//-Image and status
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickalert/quickalert.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/compability_score.dart';
import 'package:timirama/common/widgets/loading.dart';
import 'package:timirama/common/widgets/seniority.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_event.dart';
import 'package:timirama/features/follow/screen/follow_screen.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/like/bloc/like_bloc.dart';
import 'package:timirama/features/like/bloc/like_event.dart';
import 'package:timirama/features/like/bloc/like_state.dart';
import 'package:timirama/features/like/model/like_model.dart';
import 'package:timirama/features/match/bloc/match_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_sender_bloc.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/user_details/screen/user_details_screen.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

//Image and Status
class ImageAndStatus extends StatelessWidget {
  const ImageAndStatus(
      {super.key,
      required this.user,
      required this.controller,
      required this.matchUsers,
      required this.currentIndex});
  final ProfileModel user;
  final List<ProfileModel?> matchUsers;
  final CardSwiperController controller;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final validUrl = user.imgURL.isNotEmpty &&
        Uri.tryParse(user.imgURL)!.hasAbsolutePath == true;
    return GestureDetector(
      onTap: () => Get.to(() => UserDetailsScreen(data: user)),
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 618.h,
            decoration: validUrl
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: CachedNetworkImageProvider(user.imgURL),
                    ),
                  )
                : null,
          ),
          Positioned(left: 40.w, bottom: 150.h, child: UserDetails(user: user)),
          Positioned(
            left: 30.w,
            bottom: 50.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 18.w,
              children: [
                FloatingActionButton(
                  heroTag: "leftBtn",
                  backgroundColor: AppColors.red,
                  shape: CircleBorder(),
                  onPressed: () {
                    controller.swipe(CardSwiperDirection.left);
                  },
                  child: Icon(Icons.close, color: AppColors.floralWhite),
                ),
                SizedBox(width: 25.w),
                StartChatFromMatch(
                  profileModel: user,
                ),
                SizedBox(width: 25.w),
                FloatingActionButton(
                  heroTag: "rightBtn",
                  backgroundColor: AppColors.green,
                  shape: CircleBorder(),
                  onPressed: () {
                    final swipedUser = matchUsers[currentIndex];
                    context.read<MatchBloc>().add(
                          HandleRightSwipe(
                            matchedUserId: swipedUser!.id,
                            swipedUserId: swipedUser.id,
                            matchedUserName: swipedUser.pseudo,
                            matchedUserImage: swipedUser.imgURL,
                          ),
                        );
                    controller.swipe(CardSwiperDirection.right);
                  },
                  child: Icon(Icons.check, color: AppColors.floralWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Seniority
class CreatedDate extends StatelessWidget {
  const CreatedDate({super.key, required this.user});
  final ProfileModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        Seniority.formatJoinedTime(user.createdDate.toDate()),
        style: theme.bodyMedium,
      ),
    );
  }
}

//-fav , following, archive-
class ListOfButtons extends StatelessWidget {
  const ListOfButtons({
    super.key,
    required this.user,
    required this.controller,
  });
  final ProfileModel user;
  final CardSwiperController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyContainerColor,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //like
            LikeButtonForMatch(id: user.id),

            PlatformIconButton(
              onPressed: () async {
                context.read<FavoriteBloc>().add(
                      FavoriteUserAdded(favId: user.id),
                    );
                snackBarMessage(
                  context,
                  EnumLocale.savedToFavorites.name.tr,
                  Theme.of(context),
                );
                context.read<HomeBloc>().add(HomeUsersProfileList());
                controller.swipe(CardSwiperDirection.right);
              },
              icon: Icon(
                CupertinoIcons.heart,
                size: 30.r,
                color: AppColors.black,
              ),
            ),
            // following

            FollowButton(
              id: user.id,
              color: AppColors.black.withValues(alpha: 0.9),
            ),
            // Archive
            PlatformIconButton(
              onPressed: () async {
                context.read<ArchiveBloc>().add(
                      ArchiveUserAdded(archiveId: user.id),
                    );
                snackBarMessage(
                  context,
                  EnumLocale.addedToArchive.name.tr,
                  Theme.of(context),
                );
                context.read<HomeBloc>().add(HomeUsersProfileList());
                controller.swipe(CardSwiperDirection.right);
              },
              icon: Icon(
                HugeIcons.strokeRoundedArchive,
                color: AppColors.black,
                size: 30.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// only for match page-
class LikeButtonForMatch extends StatelessWidget {
  final String id;
  const LikeButtonForMatch({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LikeBloc, LikeState, LikeModel>(
      selector: (state) => state.likeUserList,
      builder: (context, likeData) {
        return PlatformIconButton(
          onPressed: () {
            if (likeData.likeId.contains(id)) {
              context.read<LikeBloc>().add(LikeUserRemoved(likeId: id));
              debugPrint("unLike  ${id}");
            } else {
              context.read<LikeBloc>().add(LikeUserAdded(likeId: id));
              debugPrint("Like  ${id}");
            }
          },
          icon: Icon(
            likeData.likeId.contains(id)
                ? CupertinoIcons.hand_thumbsup_fill
                : CupertinoIcons.hand_thumbsup,
            color:
                likeData.likeId.contains(id) ? AppColors.blue : AppColors.black,
            size: 30.r,
          ),
        );
      },
    );
  }
}

//Starting chat from match from here

class StartChatFromMatch extends StatefulWidget {
  const StartChatFromMatch({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  State<StartChatFromMatch> createState() => _StartChatFromMatchState();
}

class _StartChatFromMatchState extends State<StartChatFromMatch> {
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
    return BlocListener<RequestSenderBloc, RequestSenderState>(
      listener: _listener,
      child: BlocSelector<RequestSenderBloc, RequestSenderState, Requestmodel?>(
        selector: (state) {
          if (state is CheckingUserAvailableState) return state.userData;
          return null;
        },
        builder: (context, data) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.blue,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              height: 56,
              width: 56,
              child: PlatformIconButton(
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
                                senderId:
                                    FirebaseAuth.instance.currentUser!.uid,
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
                  color: AppColors.floralWhite,
                  size: 30,
                ),
              ),
            ),
          );
        },
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

// pesudo, age and City
class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final ProfileModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      spacing: 5.h,
      children: [
        Text(
          "${user.pseudo}, ${user.age}",
          style: Theme.of(
            context,
          )
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: 8.w,
          children: [
            CompabilityScore(
              id: user.id,
              iconSize: 25,
              fontSize: 18,
            ),
            Text(
              "(${user.city})",
              style: theme.bodyMedium!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}

//Interest grid
class Interests extends StatelessWidget {
  const Interests({super.key, required this.user});
  final ProfileModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        physics: NeverScrollableScrollPhysics(),
        itemCount: user.interests.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 3,
        ),
        itemBuilder: (BuildContext context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            height: 20.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withAlpha(10),
                  blurRadius: 2.r,
                  spreadRadius: 2.r,
                  offset: Offset(0.4.w, 0.4.h),
                  blurStyle: BlurStyle.solid,
                ),
              ],
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.primaryColor, width: 1.w),
            ),
            child: Center(
              child: Text(
                user.interests[index],
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}

//User description-
class Description extends StatelessWidget {
  const Description({super.key, required this.user});

  final ProfileModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.greyContainerColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          user.description,
          style: theme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
