import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';

class RequestSenderAppBar extends StatelessWidget {
  const RequestSenderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(EnumLocale.messageRequests.name.tr, style: theme.bodyMedium),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Icon(Icons.more_vert_outlined, color: AppColors.black),
        ),
      ],
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          HugeIcons.strokeRoundedMultiplicationSign,
          color: AppColors.black,
        ),
      ),
    );
  }
}
