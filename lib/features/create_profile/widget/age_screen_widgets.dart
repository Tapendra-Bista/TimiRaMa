import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_event.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//----------------------- Age screen------------------------

//----------------Text Regarding age description--------------------------
class AgeDescription extends StatelessWidget {
  const AgeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.dobDescription.name.tr, style: theme.bodySmall);
  }
}

//----------------Text Regarding age Title--------------------------
class AgeTitle extends StatelessWidget {
  const AgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.dobTitle.name.tr, style: theme.bodyLarge);
  }
}

//------------------------Next Button ----------------------------------
class AgeNextButton extends StatelessWidget {
  AgeNextButton({super.key});

  final AppGetStorage app = AppGetStorage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      builder: (context, state) {
        return CommonButton(
          onPressed: () {
            if (DateTime.now().year - state.dob.year > 18) {
              app.setPageNumber(5);
              Get.toNamed(AppRoutes.address);
            } else {
              snackBarMessage(
                context,
                EnumLocale.ageErrorText.name.tr,
                Theme.of(context),
              );
            }
          },
          buttonText: EnumLocale.next.name.tr,
        );
      },
    );
  }
}

//--------------- Dob picker-------------------------------
class SelectDob extends StatelessWidget {
  const SelectDob({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => BottomPicker.date(
        height: 350.h,
        buttonStyle: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        pickerTitle: Text(
          EnumLocale.setYourDob.name.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
        ),
        dateOrder: DatePickerDateOrder.ymd,
        initialDateTime: DateTime.now(),
        minDateTime: DateTime(1950),
        pickerTextStyle: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        onChange: (index) {},
        onSubmit: (value) =>
            context.read<CreateProfileBloc>().add(DobChanged(dob: value)),
        bottomPickerTheme: BottomPickerTheme.plumPlate,
      ).show(context),
      child: Container(
        height: 40.h,
        width: 130.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: BlocBuilder<CreateProfileBloc, CreateProfileState>(
            builder: (context, state) {
              debugPrint("${state.dob}");
              return Text(
                state.dob.toString().split(' ').first,
                style: theme.bodyMedium,
              );
            },
          ),
        ),
      ),
    );
  }
}
