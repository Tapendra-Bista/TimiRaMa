import 'package:equatable/equatable.dart';

sealed class FollowEvent extends Equatable {
  const FollowEvent();

  @override
  List<Object> get props => [];
}

//-----------------------------Fav Event-----------------------------
final class FollowUserAdded extends FollowEvent {
  final String followId;
  FollowUserAdded({required this.followId});
  @override
  List<Object> get props => [followId];
}

final class FollowUserRemoved extends FollowEvent {
  final String followId;
  FollowUserRemoved({required this.followId});
  @override
  List<Object> get props => [followId];
}

final class FollowUsersFetched extends FollowEvent {}
