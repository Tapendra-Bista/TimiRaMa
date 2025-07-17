import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/widgets/seniority.dart';
import 'package:timirama/common/widgets/user_status.dart';
import 'package:timirama/features/edit_profile/widgets/edit_profile_screen.widgets.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/routes/app_routes.dart';

//----------------PlatformAppBar -----------------------
class ProfilePlatformAppBar extends StatelessWidget {
  const ProfilePlatformAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      actions: [
        PlatformIconButton(
          onPressed: () {},
          icon: Icon(HugeIcons.strokeRoundedEdit04),
        ),
        PlatformIconButton(
          onPressed: () => Get.toNamed(AppRoutes.setting),
          icon: Icon(HugeIcons.strokeRoundedSettings01),
        ),
      ],
      title: PlatformAppBarTitle(),
      leading: PlatformIconButton(
        onPressed: () => Get.back(),
        icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
      ),
    );
  }
}

//----------------PlatformAppBar Title-----------------------
class PlatformAppBarTitle extends StatelessWidget {
  const PlatformAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, String>(
      selector: (state) => (state is ProfileLoaded) ? state.data.pseudo : "",
      builder: (context, data) {
        return Text(
          data,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 25.sp),
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

//----------Description-----------------------
class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<ProfileBloc, ProfileState, String>(
      selector: (state) =>
          (state is ProfileLoaded) ? state.data.description : "",
      builder: (context, data) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.greyContainerColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Text(data, style: theme.bodyMedium),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//----------------User Interests ----------------------------
class UserInterestsList extends StatelessWidget {
  const UserInterestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, List>(
      selector: (state) => (state is ProfileLoaded) ? state.data.interests : [],
      builder: (context, data) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          sliver: SliverGrid.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 3,
            ),
            itemBuilder: (BuildContext context, index) {
              final items = data[index];
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
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primaryColor, width: 1.w),
                ),
                child: Center(
                  child: Text(
                    items,
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
      },
    );
  }
}

//------------------User account age -----------------------------
class UserSeniority extends StatelessWidget {
  const UserSeniority({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<ProfileBloc, ProfileState, DateTime>(
      selector: (state) => (state is ProfileLoaded)
          ? state.data.createdDate.toDate()
          : DateTime.now(),
      builder: (context, data) {
        final date = Seniority.formatJoinedTime(data);
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.greyContainerColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(date, style: theme.bodyMedium),
              ),
            ),
          ),
        );
      },
    );
  }
}

//------------------------------------- user name , age nad city----------------------------
class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<ProfileBloc, ProfileState, ProfileModel>(
      selector: (state) =>
          (state is ProfileLoaded) ? state.data : ProfileModel.empty(),
      builder: (context, data) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
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
                    data.pseudo,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  Text("${data.age}", style: theme.bodyMedium),
                  Text(
                    data.city,
                    style: theme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//----------------------------- Profile Image-----------------------------
class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, String>(
      selector: (state) => (state is ProfileLoaded) ? state.data.imgURL : "",
      builder: (context, url) {
        final hasValidUrl =
            url.isNotEmpty && Uri.tryParse(url)?.hasAbsolutePath == true;
        return SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Stack(
                children: [
                  Container(
                    height: 380.h,
                    width: double.maxFinite.w,
                    decoration: BoxDecoration(
                      image: hasValidUrl
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(url),
                            )
                          : null,
                      color: AppColors.floralWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 5.w,
                    child: UserStatus(id: auth.currentUser!.uid),
                  ),
                  ReplacePP(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
