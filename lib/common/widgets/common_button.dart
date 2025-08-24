import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/constant/constant_colors.dart';

//- button for app
class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: SizedBox(
        height: 40.h, // Slightly increased height for better touch target
        width: 200.w,
        child: PlatformElevatedButton(
          // Using ElevatedButton for better default styling
          onPressed: onPressed,
          material: (context, platform) => MaterialElevatedButtonData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          cupertino: (context, platform) => CupertinoElevatedButtonData(
            color: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Container(
              alignment: Alignment.center,
              child: PlatformText(
                buttonText,
                style: theme.bodyMedium!.copyWith(color: AppColors.white),
              ),

              // Show indicator if loading and it's the login button
            ),
          ),
        ),
      ),
    );
  }
}
