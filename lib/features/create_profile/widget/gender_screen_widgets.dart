// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_event.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';

// Gender screen components-

//-Text Regarding gender description
class GenderDescription extends StatelessWidget {
  const GenderDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.genderDescription.name.tr, style: theme.bodySmall);
  }
}

//-Text Regarding gender Title
class GenderTitle extends StatelessWidget {
  const GenderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.genderTitle.name.tr, style: theme.bodyLarge);
  }
}

//Next Button
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

//-Gender Radio Group
class GenderRadioGroup extends StatelessWidget {
  const GenderRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Center(
      child: BlocBuilder<CreateProfileBloc, CreateProfileState>(
        builder: (context, state) {
          return Column(
            spacing: 20.h,
            children: [
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.primaryColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: RadioListTile<String>(
                  value: EnumLocale.genderMale.name.tr,
                  groupValue: state.gender,
                  onChanged: (value) {
                    context
                        .read<CreateProfileBloc>()
                        .add(GenderChanged(gender: value!));
                  },
                  title: Text(EnumLocale.genderMale.name.tr,
                      style: theme.bodyMedium),
                  activeColor: AppColors.green,
                ),
              ),
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.primaryColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: RadioListTile<String>(
                  value: EnumLocale.genderFemale.name.tr,
                  groupValue: state.gender,
                  onChanged: (value) {
                    context
                        .read<CreateProfileBloc>()
                        .add(GenderChanged(gender: value!));
                  },
                  title: Text(EnumLocale.genderFemale.name.tr,
                      style: theme.bodyMedium),
                  activeColor: AppColors.green,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
