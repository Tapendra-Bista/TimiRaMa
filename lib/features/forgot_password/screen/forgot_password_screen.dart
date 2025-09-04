import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/features/forgot_password/widgets/forgot_password_widgets.dart';

// Optimized with const constructor
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  //-Forgot password text-
                  const Heading(),
                  SizedBox(height: 5.h),
                  //-Instruction text-
                  const BodyWidget(),
                  //Center image of Email-
                  SizedBox(height: 35.h),
                  const CenterImage(),
                  SizedBox(height: 35.h),
                  //-User input for email-
                  const Email(),
                  SizedBox(height: 25.h),
                  //-Remember password -
                  const RememberPassword(),
                  SizedBox(height: 10.h),
                  // Email send Button-
                  SendButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
