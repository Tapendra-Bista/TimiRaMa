import 'package:timirama/common/constant/constant_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.greyContainerColor,
      color: AppColors.primaryColor,
    );
  }
}
