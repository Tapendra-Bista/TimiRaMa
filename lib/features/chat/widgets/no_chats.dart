import 'package:timirama/common/localization/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

class NoChats extends StatelessWidget {
  const NoChats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PlatformScaffold(
      body: Center(
        child: Text(EnumLocale.noRecentChats.name.tr, style: theme.bodyMedium),
      ),
    );
  }
}
