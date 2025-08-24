import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/features/forgot_password/widgets/forgot_password_widgets.dart';

//Email sent 
class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                //-Email sent  text-
                HeadingInSuccessedPage(),
                SizedBox(height: 5.h),
                //-Instruction text-
                BodyWidgetInSuccessedPage(),
                //Center image after email send-
                CenterImageInSuccessedPage(),

                SizedBox(height: 100.h),

                // Login page Button-
                SendButtonInSuccessedPage(),
                SizedBox(height: 10.h),
                //-Resend link -
                DidnotRecieveTheLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
