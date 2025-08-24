import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/like_button.dart';
import 'package:timirama/common/widgets/seniority.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/common/widgets/start_chat.dart';
import 'package:timirama/common/widgets/user_status.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

// user Image
class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.Homedata});
  final ProfileModel? Homedata;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: 380.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(Homedata!.imgURL),
            ),
          ),
        ),
        Positioned(
          top: 8.r,
          right: 8.r,
          child: UserStatus(id: Homedata!.id),
        ),
      ],
    );
  }
}

//Seniority
class CreatedDate extends StatelessWidget {
  const CreatedDate({super.key, required this.Homedata});
  final ProfileModel? Homedata;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Text(
        Seniority.formatJoinedTime(Homedata!.createdDate.toDate()),
        style: theme.bodyMedium,
      ),
    );
  }
}

//button list-

//-Like, Chat, Archives, Achieve-
class ButtonsList extends StatelessWidget {
  const ButtonsList({super.key, required this.Homedata});
  final ProfileModel? Homedata;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // like button-
          LikeButton(id: Homedata!.id),
          StartChat(profileModel: Homedata!),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlatformIconButton(
                onPressed: () {
                  context.read<ArchiveBloc>().add(
                        ArchiveUserRemoved(archiveId: Homedata!.id),
                      );
                  context.read<HomeBloc>().add(HomeUsersProfileList());
                  snackBarMessage(
                    context,
                    EnumLocale.removedFromArchive.name.tr,
                    Theme.of(context),
                  );
                },
                icon: Icon(
                  Icons.archive_sharp,
                  color: AppColors.blue,
                  size: 30,
                ),
              ),
              Text(
                EnumLocale.unArchive.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// pesudo, age and City
class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.greyContainerColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(profileModel.pseudo,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
          Text("${profileModel.age}",
              style: theme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
          Text(
            profileModel.city,
            style: theme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

//User description-
class Description extends StatelessWidget {
  const Description({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.greyContainerColor,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Text(profileModel.description, style: theme.bodyMedium),
      ),
    );
  }
}

// interests Grid
//Interest grid
class Interests extends StatelessWidget {
  const Interests({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: profileModel.interests.length,
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
              profileModel.interests[index],
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
