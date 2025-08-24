import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/widgets/steps.dart';
import 'package:timirama/features/create_profile/widget/create_profile_widgets.dart';

class PassionScreen extends StatelessWidget {
  const PassionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                //Stepper to show in which step they are in profile creation
                CustomSteps(currentStep: 5),
                //main text
                const InterestTitle(),

                //Food text-
                const FoodText(),
                //- Food inchoice
                const FoodInchoice(),
                //Adventure text-
                const AdventureText(),
                //- Adventure inchoice
                const AdventureInchoice(),
                // passion title 
                const PassionTitle(),

                //Passion choice
                const PassionChoice(),
                SizedBox(height: 15.h),
                PassionNextButton(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
