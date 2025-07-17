import 'package:timirama/common/constant/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

//--------------circular indicator for app------------------------------------------
class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: PlatformCircularProgressIndicator(
          material: (context, platform) {
            return MaterialProgressIndicatorData(color: AppColors.primaryColor);
          },
          cupertino: (context, platform) {
            return CupertinoProgressIndicatorData(
              color: AppColors.primaryColor,
            );
          },
        ),
      ),
    );
  }
}

/*    material: (context, platform) {
              return MaterialAppBarData(centerTitle: true);
            },*/
