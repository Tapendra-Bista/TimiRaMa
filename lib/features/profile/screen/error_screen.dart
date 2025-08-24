import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/profile/widget/profile_widget.dart';
import 'package:timirama/routes/app_routes.dart';

//Widget to show for error state
class ProfileErrorContent extends StatelessWidget {
  const ProfileErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, String?>(
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
            trailingActions: [
              PlatformIconButton(
                onPressed: () => Get.toNamed(AppRoutes.setting),
                icon: Icon(HugeIcons.strokeRoundedSettings01),
              ),
            ],
            title: PlatformAppBarTitle(),
            leading: PlatformIconButton(
              onPressed: () => Get.back(),
              icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
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
