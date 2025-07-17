import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/follow/bloc/follow_bloc.dart';
import 'package:timirama/features/follow/bloc/follow_event.dart';
import 'package:timirama/features/follow/bloc/follow_state.dart';
import 'package:timirama/features/follow/model/follow_model.dart';

class FollowButton extends StatelessWidget {
  final String id;
  final Color color;
  const FollowButton({
    super.key,
    required this.id,
    this.color = AppColors.floralWhite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<FollowBloc, FollowState, FollowModel>(
      selector: (state) => state.followUserList,
      builder: (context, followData) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(5.r),
            border: BoxBorder.all(color: color, width: 1.5.w),
          ),
          child: InkWell(
            onTap: () {
              if (followData.followId.contains(id)) {
                context.read<FollowBloc>().add(FollowUserRemoved(followId: id));
                debugPrint("unFollow  ${id}");
              } else {
                context.read<FollowBloc>().add(FollowUserAdded(followId: id));
                debugPrint("Follow  ${id}");
              }
            },
            child: Center(
              child: Text(
                followData.followId.contains(id)
                    ? EnumLocale.following.name.tr
                    : EnumLocale.follow.name.tr,
                style: theme.bodyMedium!.copyWith(
                  color: color,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
