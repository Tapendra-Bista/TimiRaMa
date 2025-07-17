import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

//---------------To change profile picture
class ReplacePP extends StatelessWidget {
  const ReplacePP({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: _listener,
      child: Positioned(
        bottom: 4.h,
        right: 3.w,
        child: GestureDetector(
          onTap: () => showPlatformModalSheet(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {
                        print("Camera is Selected");

                        context.read<EditProfileBloc>().add(
                          ReplaceImage(imageSource: ImageSource.camera),
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
                        context.read<EditProfileBloc>().add(
                          ReplaceImage(imageSource: ImageSource.gallery),
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
          child: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: AppColors.floralWhite,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: AppColors.grey.withValues(alpha: 0.8),
                width: 0.3,
              ),
            ),
            child: Text(
              EnumLocale.replaceProfilePic.name.tr,
              style: theme.bodySmall!.copyWith(
                color: AppColors.black,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is Uploading) {
      snackBarMessage(context, EnumLocale.uploading.name.tr, Theme.of(context));
    }

    if (state is Uploaded) {
      getIt<ProfileBloc>().add(ProfileUpdate());
      snackBarMessage(context, EnumLocale.uploaded.name.tr, Theme.of(context));
    }
  }
}
