import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/seniority.dart';
import 'package:timirama/services/status/bloc/status_bloc.dart';
import 'package:timirama/services/status/bloc/status_state.dart';
import 'package:timirama/services/status/model/status_model.dart';

// User state online or offline-
class UserState extends StatelessWidget {
  final String? userId;
  
  const UserState({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StatusBloc, StatusState, StatusModel>(
      selector: (state) {
        if (userId != null) {
          // Get status for the specific user
          final userStatus = state.getStatusForUser(userId!);
          if (userStatus != null) {
            return userStatus;
          }
          // Fallback to current status if it's for this user
          if (state.currentUserId == userId) {
            return state.status;
          }
        }
        // Default fallback
        return state.status;
      },
      builder: (context, status) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          status.lastChanged,
        );
        return status.state
            ? Text(
                EnumLocale.online.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.green),
              )
            : Text(
                Seniority.formatChatTime(dateTime),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 11),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
      },
    );
  }
}
