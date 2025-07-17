import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/features/home/widget/home_widgets.dart';
import 'package:timirama/routes/app_routes.dart';

//---------Widget to show for error state--------------------------
class HomeErrorContent extends StatelessWidget {
  const HomeErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, String?>(
      selector: (state) {
        {
          if (state is Error) {
            return state.error; // error message string
          }
          // no error
        }
        return null;
      },
      builder: (context, errorMessage) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            material: (context, platform) =>
                MaterialAppBarData(centerTitle: true),
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(errorMessage!),
            ),
          ),
        );
      },
    );
  }
}
