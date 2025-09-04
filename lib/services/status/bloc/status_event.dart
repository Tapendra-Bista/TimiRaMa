import 'package:equatable/equatable.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object> get props => [];
}

class GetStatus extends StatusEvent {
  final String uid;

  const GetStatus({required this.uid});

  @override
  List<Object> get props => [uid];
}

class GetCurrentStatus extends StatusEvent {
  final String uid;

  const GetCurrentStatus({required this.uid});

  @override
  List<Object> get props => [uid];
}

class ListenToStatus extends StatusEvent {
  final String uid;

  const ListenToStatus({required this.uid});

  @override
  List<Object> get props => [uid];
}

class StopListeningToStatus extends StatusEvent {
  final String uid;

  const StopListeningToStatus({required this.uid});

  @override
  List<Object> get props => [uid];
}

class UpdateStatus extends StatusEvent {
  final String userId;
  final bool isOnline;

  const UpdateStatus({required this.userId, required this.isOnline});

  @override
  List<Object> get props => [userId, isOnline];
}

class GetUserStatus extends StatusEvent {
  final String uid;

  const GetUserStatus({required this.uid});

  @override
  List<Object> get props => [uid];
}
