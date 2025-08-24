import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/localization/enums/enums.dart';
//Empty Data widget

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        material: (context, platform) {
          return MaterialAppBarData(centerTitle: true);
        },
        leading: PlatformIconButton(
          onPressed: () => Get.back(),
          icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
        ),
        title: Text(EnumLocale.block.name.tr, style: theme.bodyMedium),
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
