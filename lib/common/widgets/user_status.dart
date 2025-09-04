import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/services/status/bloc/status_bloc.dart';
import 'package:timirama/services/status/bloc/status_event.dart';
import 'package:timirama/services/status/bloc/status_state.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({
    super.key,
    this.height = 20,
    this.width = 20,
    required this.id,
  });
  final double height;
  final double width;
  final String id;
  @override
  State<UserStatus> createState() => _UserStatusState();
}

//To check user is online or offline
class _UserStatusState extends State<UserStatus> {
  bool _isListening = false;
  bool _hasReceivedStatus = false;
  StatusBloc? _statusBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Save reference to the bloc to safely use it in dispose()
    _statusBloc ??= context.read<StatusBloc>();
  }

  @override
  void initState() {
    super.initState();
    // Defer bloc access until after didChangeDependencies
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _statusBloc != null) {
        // First get the current status
        if (kDebugMode) {
          print('UserStatus: Getting current status for user: ${widget.id}');
        }
        _statusBloc!.add(GetUserStatus(uid: widget.id));

        // Then start listening to real-time status updates
        if (!_isListening) {
          if (kDebugMode) {
            print(
                'UserStatus: Starting to listen to status for user: ${widget.id}');
          }
          _statusBloc!.add(ListenToStatus(uid: widget.id));
          _isListening = true;
        }
      }
    });
  }

  @override
  void dispose() {
    // Stop listening when widget is disposed using saved bloc reference
    if (_isListening && _statusBloc != null) {
      if (kDebugMode) {
        print('UserStatus: Stopping status listening for user: ${widget.id}');
      }
      _statusBloc!.add(StopListeningToStatus(uid: widget.id));
      _isListening = false;
    }
    _statusBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StatusBloc, StatusState, bool>(
      selector: (state) {
        // Get status for the specific user
        final userStatus = state.getStatusForUser(widget.id);
        if (userStatus != null) {
          return userStatus.state;
        }
        // Fallback to current status if it's for this user
        if (state.currentUserId == widget.id) {
          return state.status.state;
        }
        // Default to offline if no status found
        return false;
      },
      builder: (context, value) {
        // Mark that we've received a status update
        if (!_hasReceivedStatus) {
          _hasReceivedStatus = true;
          if (kDebugMode) {
            print(
                'UserStatus: Received first status update for user ${widget.id}: $value');
          }
        }

        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: value ? AppColors.green : AppColors.grey,
              width: 2.w,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 1.r,
                spreadRadius: 1.r,
                blurStyle: BlurStyle.outer,
                color: value ? AppColors.green : AppColors.grey,
              ),
            ],
            color: value ? AppColors.green : AppColors.grey,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
