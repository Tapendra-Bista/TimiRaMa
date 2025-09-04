import 'package:timirama/services/status/model/status_model.dart';
import 'package:equatable/equatable.dart';

class StatusState extends Equatable {
  final StatusModel status;
  final Map<String, StatusModel> userStatuses;
  final String? currentUserId;
  
  const StatusState({
    required this.status,
    this.userStatuses = const {},
    this.currentUserId,
  });

  StatusState copyWith({
    StatusModel? status,
    Map<String, StatusModel>? userStatuses,
    String? currentUserId,
  }) =>
      StatusState(
        status: status ?? this.status,
        userStatuses: userStatuses ?? this.userStatuses,
        currentUserId: currentUserId ?? this.currentUserId,
      );

  factory StatusState.initial() {
    return StatusState(status: StatusModel.empty);
  }

  // Get status for a specific user
  StatusModel? getStatusForUser(String userId) {
    return userStatuses[userId];
  }

  @override
  List<Object?> get props => [status, userStatuses, currentUserId];
}

final class StatusInitial extends StatusState {
  StatusInitial() : super(status: StatusModel.empty);
}
