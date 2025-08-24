import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';

//privacy and policy regarding app-
class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ).copyWith(bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                Text(
                  EnumLocale.privacyTitle.name.tr,
                  style: theme.bodyLarge!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 22,
                  ),
                ),
                Text(EnumLocale.privacyBody.name.tr, style: theme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
