import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timirama/common/localization/enums/enums.dart';

class NoRequests extends StatelessWidget {
  const NoRequests({super.key});
  //-Empty data-
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: Text(EnumLocale.noDataAvailable.name.tr, style: theme.bodyMedium),
    );
  }
}
