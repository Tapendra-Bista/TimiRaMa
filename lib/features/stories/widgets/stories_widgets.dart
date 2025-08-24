import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/stories/bloc/stories_bloc.dart';
import 'package:timirama/features/stories/model/stories_model.dart';
import 'package:timirama/features/stories/screen/view_stories.dart';

//Other user Stories-
class OtherUserStories extends StatelessWidget {
  const OtherUserStories({super.key, required this.data});

  final StoriesFetchModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isValidImage = Uri.tryParse(data.userImg)!.hasAbsolutePath == true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AdvancedAvatar(
          foregroundDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2.5),
          ),
          decoration: const BoxDecoration(
            color: AppColors.floralWhite,
            shape: BoxShape.circle,
          ),
          image: isValidImage ? CachedNetworkImageProvider(data.userImg) : null,
          size: 75.r,
        ),
        Text(
          data.userName,
          style: theme.bodySmall!.copyWith(
            color: AppColors.black,
            fontSize: 11.2.sp,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

//Current user Stories-
class OwnStories extends StatelessWidget {
  const OwnStories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<StoriesBloc, StoriesState, StoriesFetchModel>(
      selector: (state) => state.currentUserStoriesData,
      builder: (context, currentUserStoriesData) {
        return GestureDetector(
          onTap: () {
            if (currentUserStoriesData.containUrl.isNotEmpty) {
              Get.to(() => ViewStories(data: currentUserStoriesData));
            }
          },
          child: BlocSelector<StoriesBloc, StoriesState, ProfileModel>(
            selector: (state) => state.profileData,
            builder: (context, profileData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AdvancedAvatar(
                    foregroundDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.5,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.floralWhite,
                      shape: BoxShape.circle,
                    ),
                    image: Uri.tryParse(profileData.imgURL)!.hasAbsolutePath ==
                            true
                        ? CachedNetworkImageProvider(profileData.imgURL)
                        : null,
                    size: 75.r,
                    children: [
                      Positioned(
                        right: -0.4,
                        bottom: -0.4,
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: PlatformIconButton(
                            padding: EdgeInsets.zero,
                            material: (context, platform) =>
                                MaterialIconButtonData(
                              constraints: const BoxConstraints(),
                              iconSize: 25.r,
                            ),
                            onPressed: () => showPlatformModalSheet(
                              material: MaterialModalSheetData(
                                backgroundColor: AppColors.transparent,
                              ),
                              context: context,
                              builder: (context) => Padding(
                                padding: EdgeInsets.all(14.r),
                                child: Material(
                                  borderRadius: BorderRadius.circular(18.r),
                                  elevation: 10,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          print("Camera is Selected");
                                          context.read<StoriesBloc>().add(
                                                StoriesImage(
                                                  source: ImageSource.camera,
                                                  name: profileData.pseudo,
                                                  img: profileData.imgURL,
                                                ),
                                              );
                                          Get.back();
                                        },
                                        leading: Icon(
                                          CupertinoIcons.photo_camera,
                                          color: AppColors.black,
                                        ),
                                        title: Text(
                                          EnumLocale.selecteFromCamera.name.tr,
                                          style: theme.bodyMedium,
                                        ),
                                      ),
                                      CustomDivider(),
                                      ListTile(
                                        onTap: () {
                                          print("Gallery  is Selected");
                                          context.read<StoriesBloc>().add(
                                                StoriesImage(
                                                  source: ImageSource.gallery,
                                                  name: profileData.pseudo,
                                                  img: profileData.imgURL,
                                                ),
                                              );
                                          Get.back();
                                        },
                                        leading: Icon(
                                          Icons.collections_outlined,
                                          color: AppColors.black,
                                        ),
                                        title: Text(
                                          EnumLocale.selecteFromGallery.name.tr,
                                          style: theme.bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            icon: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.floralWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    EnumLocale.yourStory.name.tr,
                    style: theme.bodySmall!.copyWith(
                      color: AppColors.black,
                      fontSize: 11.2.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
