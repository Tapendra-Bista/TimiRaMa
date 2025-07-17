//----------------PlatformAppBar -----------------------
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/routes/app_routes.dart';

//-------------------App Bar-------------------------------
class HomePlatformAppBar extends StatelessWidget {
  const HomePlatformAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      actions: [
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
    );
  }
}

class CityName extends StatelessWidget {
  const CityName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, String>(
      selector: (state) => (state is ProfileLoaded) ? state.data.city : '',
      builder: (context, city) => PlatformText(
        city,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
