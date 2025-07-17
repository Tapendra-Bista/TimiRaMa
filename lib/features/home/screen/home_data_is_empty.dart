import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/home/widget/home_widgets.dart';
import 'package:timirama/routes/app_routes.dart';
//------------------Empty Data widget---------------------

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        material: (context, platform) => MaterialAppBarData(centerTitle: true),
        trailingActions: [
          PlatformIconButton(
            onPressed: () => Get.toNamed(AppRoutes.preferences),
            icon: Icon(Icons.tune_outlined, size: 35.r),
          ),
        ],
        title: CityName(),
        leading: PlatformIconButton(
          onPressed: () => Get.toNamed(AppRoutes.profile),
          icon: Icon(LineIcons.user, size: 35.r),
        ),
      ),
      body: Center(
        child: Text(
          EnumLocale.noDataAvailable.name.tr,
          style: theme.bodyMedium,
        ),
      ),
    );
  }
}
