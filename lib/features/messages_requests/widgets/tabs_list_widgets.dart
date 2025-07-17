import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:timirama/common/localization/enums/enums.dart';

//---------------For list of requests Sends-----------------
class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.fromYou.name.tr,
      style: theme.bodyLarge!.copyWith(fontSize: 15.sp),
    );
  }
}

//---------------For list of requests Receiver-----------------
class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.toYou.name.tr,
      style: theme.bodyLarge!.copyWith(fontSize: 15.sp),
    );
  }
}
