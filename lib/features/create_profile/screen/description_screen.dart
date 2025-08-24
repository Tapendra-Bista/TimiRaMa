import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/widgets/steps.dart';
import 'package:timirama/features/create_profile/widget/description_screen_widgets.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  //Stepper to show in which step they are in profile creation
                  const CustomSteps(currentStep: 6),
                  //-Title Text
                  const DescriptionTitle(),
                  //Body text-
                  const DescriptionBody(),

                  SizedBox(height: 20.h),

                  //Textfield for user input for description
                  const TextFieldForDescription(),
                  //Next Button-
                  SizedBox(height: 40.h),
                  DescriptionNextButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
