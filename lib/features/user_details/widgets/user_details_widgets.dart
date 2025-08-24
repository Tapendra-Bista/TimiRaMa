// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/common/widgets/compability_score.dart';
import 'package:timirama/common/widgets/like_button.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/common/widgets/start_chat.dart';
import 'package:timirama/common/widgets/user_status.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_event.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_event.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/user_details/screen/user_details_screen.dart';
import 'package:timirama/routes/app_routes.dart';

//-Image and status
class StackWidget extends StatelessWidget {
  const StackWidget({
    super.key,
    required this.hasValidUrl,
    required this.widget,
  });

  final bool hasValidUrl;
  final UserDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
      sliver: SliverToBoxAdapter(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 380.h,
              decoration: hasValidUrl
                  ? BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(widget.data.imgURL),
                      ),
                    )
                  : null,
            ),
            Positioned(
              top: 8.r,
              right: 8.r,
              child: UserStatus(id: widget.data.id),
            ),
          ],
        ),
      ),
    );
  }
}

//Seniority
class CreatedDate extends StatelessWidget {
  const CreatedDate({super.key, required this.date, required this.id});

  final String date;
  final String id;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 10.h),
      sliver: SliverToBoxAdapter(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.greyContainerColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: theme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                CompabilityScore(
                  id: id,
                  iconSize: 25,
                  fontSize: 18,
                  textColor: AppColors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//User description-
class Description extends StatelessWidget {
  const Description({super.key, required this.widget});

  final UserDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 5.h),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.greyContainerColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Text(widget.data.description, style: theme.bodyMedium),
            ),
          ),
        ),
      ),
    );
  }
}

//Interest grid
class Interests extends StatelessWidget {
  const Interests({super.key, required this.widget});

  final UserDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.h),
      sliver: SliverGrid.builder(
        itemCount: widget.data.interests.length,
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
                widget.data.interests[index],
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

// pesudo, age and City
class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.widget});

  final UserDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 10.h),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.greyContainerColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.data.pseudo,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "${widget.data.age}",
                style: theme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                widget.data.city,
                style: theme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-Like, Chat, Favorites, Achieve-
class ButtonList extends StatelessWidget {
  const ButtonList({super.key, required this.model});
  final ProfileModel model;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.greyContainerColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // like button-
              LikeButton(id: model.id),
              //Message-
              StartChat(profileModel: model),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlatformIconButton(
                    onPressed: () {
                      context.read<FavoriteBloc>().add(
                            FavoriteUserAdded(favId: model.id),
                          );
                      snackBarMessage(
                        context,
                        EnumLocale.savedToFavorites.name.tr,
                        Theme.of(context),
                      );
                      context.read<HomeBloc>().add(HomeUsersProfileList());

                      Get.toNamed(AppRoutes.main);
                    },
                    icon: Icon(
                      CupertinoIcons.heart,
                      size: 31,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    EnumLocale.Favorite.name.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: AppColors.black),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlatformIconButton(
                    onPressed: () {
                      context.read<ArchiveBloc>().add(
                            ArchiveUserAdded(archiveId: model.id),
                          );
                      snackBarMessage(
                        context,
                        EnumLocale.addedToArchive.name.tr,
                        Theme.of(context),
                      );

                      context.read<HomeBloc>().add(HomeUsersProfileList());
                      Get.toNamed(AppRoutes.main);
                    },
                    icon: Icon(
                      HugeIcons.strokeRoundedArchive,
                      color: AppColors.black,
                      size: 30,
                    ),
                  ),
                  Text(
                    EnumLocale.archive.name.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//- PlatformAppBar
class UserDetailsPlatformAppBar extends StatelessWidget {
  const UserDetailsPlatformAppBar({
    Key? key,
    required this.isScrollingUp,
    required this.data,
  }) : super(key: key);
  final bool isScrollingUp;
  final ProfileModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      title: Text(
        isScrollingUp ? '' : data.pseudo,
        style: theme.bodyLarge!.copyWith(fontSize: 25.sp),
        overflow: TextOverflow.ellipsis,
      ),
      leading: PlatformIconButton(
        onPressed: () => Get.back(),
        icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
      ),
      actions: [
        PopupMenuButton(
          tooltip: EnumLocale.more.name.tr,
          color: AppColors.floralWhite.withValues(alpha: 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () => Get.toNamed(AppRoutes.report),
              child: Text(
                EnumLocale.report.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.red),
              ),
            ),
            PopupMenuItem(
              onTap: () => showDialog(
                context: context,
                builder: (context) => BlockAlertDialog(data: data),
              ),
              child: Text(EnumLocale.block.name.tr, style: theme.bodyMedium),
            ),
          ],
        ),
      ],
    );
  }
}

// Dialog Box to ask for block
class BlockAlertDialog extends StatelessWidget {
  const BlockAlertDialog({super.key, required this.data});
  final ProfileModel data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      titlePadding: EdgeInsets.only(top: 10.h),
      title: Icon(
        Icons.block_outlined,
        color: AppColors.red,
        size: 100.r,
        shadows: [
          Shadow(
            color: AppColors.primaryColor.withValues(alpha: 1),
            blurRadius: 100.r,
          ),
        ],
      ),
      backgroundColor: AppColors.floralWhite,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grey, width: 1),
        borderRadius: BorderRadiusGeometry.circular(8.r),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            EnumLocale.blockTitle.name.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          Builder(
            builder: (BuildContext newContext) {
              return CommonButton(
                onPressed: () async {
                  newContext.read<BlockBloc>().add(
                        BlockUserAdded(blockId: data.id),
                      );
                  snackBarMessage(
                    newContext,
                    "${data.pseudo} ${EnumLocale.addedToBlock.name.tr}",
                    Theme.of(newContext),
                  );

                  context.read<HomeBloc>().add(HomeUsersProfileList());
                  Get.toNamed(AppRoutes.main);
                },
                buttonText: EnumLocale.yesBlock.name.tr,
              );
            },
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              EnumLocale.cancel.name.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
