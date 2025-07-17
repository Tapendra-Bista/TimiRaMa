import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_event.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// -----------------------------Gender screen components-----------------------------------

//----------------Text Regarding gender description--------------------------
class GenderDescription extends StatelessWidget {
  const GenderDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.genderDescription.name.tr, style: theme.bodySmall);
  }
}

//----------------Text Regarding gender Title--------------------------
class GenderTitle extends StatelessWidget {
  const GenderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.genderTitle.name.tr, style: theme.bodyLarge);
  }
}

//------------------------Next Button ----------------------------------
class GenderNextButton extends StatelessWidget {
  GenderNextButton({super.key});

  final AppGetStorage app = AppGetStorage();

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        app.setPageNumber(4);
        Get.toNamed(AppRoutes.age);
      },
      buttonText: EnumLocale.next.name.tr,
    );
  }
}

//----------------Female gender---------------------

class Female extends StatelessWidget {
  const Female({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        height: 60.h,
        width: 225.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(
              EnumLocale.genderFemale.name.tr,
              style: theme.bodyMedium,
            ),
            trailing: SizedBox(
              width: 50.w,
              child: BlocBuilder<CreateProfileBloc, CreateProfileState>(
                builder: (context, state) {
                  return Radio<String>(
                    activeColor: AppColors.green,
                    value: EnumLocale.genderFemale.name.tr,
                    groupValue: state.gender,
                    onChanged: (value) => context.read<CreateProfileBloc>().add(
                      GenderChanged(gender: value!),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------Male gender---------------------
class Male extends StatelessWidget {
  const Male({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        height: 60.h,
        width: 225.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(EnumLocale.genderMale.name.tr, style: theme.bodyMedium),
            trailing: SizedBox(
              width: 50.w,
              child: BlocBuilder<CreateProfileBloc, CreateProfileState>(
                builder: (context, state) {
                  return Radio<String>(
                    activeColor: AppColors.green,
                    value: EnumLocale.genderMale.name.tr,
                    groupValue: state.gender,
                    onChanged: (value) => context.read<CreateProfileBloc>().add(
                      GenderChanged(gender: value!),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
