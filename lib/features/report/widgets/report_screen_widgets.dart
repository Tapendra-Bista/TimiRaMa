import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';

class ReportDescriptionTwo extends StatelessWidget {
  const ReportDescriptionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.reportDescription2.name.tr, style: theme.bodySmall);
  }
}

class ReportDescriptionOne extends StatelessWidget {
  const ReportDescriptionOne({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.reportDescription1.name.tr, style: theme.bodySmall);
  }
}

class MiniDescriptionText extends StatelessWidget {
  const MiniDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.notRevealIdentity.name.tr,
      style: theme.bodySmall!.copyWith(color: AppColors.black),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.whyAreYouReporting.name.tr,
      style: theme.bodyLarge!.copyWith(color: AppColors.red),
    );
  }
}
