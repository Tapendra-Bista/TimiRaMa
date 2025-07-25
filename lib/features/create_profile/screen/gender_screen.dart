import 'package:timirama/common/widgets/steps.dart';
import 'package:timirama/features/create_profile/widget/gender_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                //---------------Stepper to show in which step they are in profile creation------------------------
                const CustomSteps(currentStep: 2),
                //----------------Text Regarding name Title--------------------------
                const GenderTitle(),

                //----------------Text Regarding name description--------------------------
                const GenderDescription(),
                SizedBox(height: 20.h),

                //----------------Male gender---------------------
                const Male(),

                //----------------Female gender---------------------
                const Female(),

                SizedBox(height: 80.h),
                //----------------- Button to naviagte next page------------
                GenderNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
