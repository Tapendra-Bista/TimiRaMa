// main part of data fetched state
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';

class CompabilityScore extends StatelessWidget {
  const CompabilityScore(
      {super.key,
      required this.id,
      this.fontSize = 12,
      this.iconSize = 15,
      this.textColor = AppColors.floralWhite});

  final String id;
  final double fontSize;
  final double iconSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, Map<String, double>>(
      selector: (state) {
        return state.compatibilityScores;
      },
      builder: (context, compatibilityScores) {
        final score = compatibilityScores[id] ?? 0.0;

        return Row(
          children: [
            Text(
              (score * 100).toStringAsFixed(1),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Icon(Icons.favorite, color: Colors.red, size: iconSize.r),
          ],
        );
      },
    );
  }
}
