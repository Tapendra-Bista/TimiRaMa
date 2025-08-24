import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_state.dart';
//Error widget

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<BlockBloc, BlockState, String?>(
      selector: (state) {
        if (state is BlockUsersError) {
          return state.errorMessage;
        }

        return null;
      },
      builder: (context, error) {
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
          body: Center(child: Text(error!, style: theme.bodyMedium)),
        );
      },
    );
  }
}
