import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

class ErrorWhileFetching extends StatelessWidget {
  const ErrorWhileFetching({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<HomeBloc, HomeState, String?>(
      bloc: getIt<HomeBloc>(),
      selector: (state) {
        if (state is Error) {
          return state.error;
        }
        return "Something went wrong";
      },
      builder: (context, message) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            material: (context, platform) {
              return MaterialAppBarData(centerTitle: true);
            },
            title: Image.asset(
              AppStrings.logoImage,
              width: 200.w,
            ),
            leading: PlatformIconButton(
              onPressed: () => Get.toNamed(AppRoutes.profile),
              icon: Icon(LineIcons.user, size: 35.r),
            ),
          ),
          body: Center(child: Text(message!, style: theme.bodyMedium)),
        );
      },
    );
  }
}
