import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/utils/validators.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/common/widgets/common_textfield.dart';
import 'package:timirama/features/report/bloc/report_bloc.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

//Confirm information
class ConfirmInformation extends StatelessWidget {
  const ConfirmInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      height: 84.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.greyContainerColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 240.w,
            child: Text.rich(
              TextSpan(
                text: '* ',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.red,
                      fontSize: 14.sp,
                    ),
                children: [
                  TextSpan(
                    text: EnumLocale.sendReportTitle.name.tr,
                    style: theme.bodySmall!.copyWith(
                      color: AppColors.black,
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<ReportBloc, ReportState, bool>(
            bloc: getIt<ReportBloc>(),
            selector: (state) {
              if (state is Agree) return state.agree;
              return false;
            },
            builder: (context, agree) {
              return Switch(
                activeTrackColor: AppColors.primaryColor,
                activeThumbColor: AppColors.white,
                value: agree,
                onChanged: (value) =>
                    getIt<ReportBloc>().add(AgreeCondition(agree: value)),
              );
            },
          ),
        ],
      ),
    );
  }
}

//- Send Button
class SendReportButton extends StatelessWidget {
  const SendReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ReportBloc, ReportState, bool>(
      bloc: getIt<ReportBloc>(),
      selector: (state) {
        if (state is Agree) return state.agree;
        return false;
      },
      builder: (context, agree) {
        return agree
            ? CommonButton(
                onPressed: () {
                  print("CLICKED");
                  showModalBottomSheet(
                    isDismissible:
                        false, // 👈 Prevent dismiss by tapping outside
                    enableDrag: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.zero,
                    ),
                    useSafeArea: true,
                    backgroundColor: AppColors.floralWhite,
                    context: context,
                    builder: (context) =>
                        PopScope(canPop: false, child: BottomSheetContant()),
                  );
                },
                buttonText: EnumLocale.sendReport.name.tr,
              )
            : SizedBox.shrink();
      },
    );
  }
}

//Contant
class BottomSheetContant extends StatelessWidget {
  const BottomSheetContant({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 10.h,
      children: [
        SizedBox(height: 20.h),
        Icon(
          Icons.flag_circle_outlined,
          color: AppColors.red,
          size: 100.r,
          shadows: [
            Shadow(
              color: AppColors.primaryColor.withValues(alpha: 1),
              blurRadius: 100.r,
            ),
          ],
        ),
        Text(
          EnumLocale.thankForReport.name.tr,
          style: theme.bodyMedium!.copyWith(fontSize: 20.sp),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            EnumLocale.thankForReportDescription.name.tr,
            style: theme.bodySmall,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.greyContainerColor,
                ),
              ),
              onPressed: () {},
              child: Text(
                EnumLocale.block.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.red),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.greyContainerColor,
                ),
              ),
              onPressed: () => Get.back(),
              child: Text(
                EnumLocale.done.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.green),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}

//-Title text
class SendReportTitle extends StatelessWidget {
  const SendReportTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      EnumLocale.sendReportTitle.name.tr,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

//Reporter Name
class ReporterName extends StatefulWidget {
  const ReporterName({super.key});

  @override
  State<ReporterName> createState() => _ReporterNameState();
}

class _ReporterNameState extends State<ReporterName> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      labelText: EnumLocale.nameHintText.name.tr,
      controller: _nameController,
      validator: AppValidator.validatePseudo,
      obscureText: false,
      onChanged: (value) {},
    );
  }
}

//Reporter Email
class ReporterEmail extends StatefulWidget {
  const ReporterEmail({super.key});

  @override
  State<ReporterEmail> createState() => _ReporterEmailState();
}

class _ReporterEmailState extends State<ReporterEmail> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      labelText: EnumLocale.emailHint.name.tr,
      controller: _emailController,
      validator: AppValidator.validatePseudo,
      obscureText: false,
      onChanged: (value) {},
    );
  }
}
