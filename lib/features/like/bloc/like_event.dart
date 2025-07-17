import 'package:equatable/equatable.dart';

sealed class LikeEvent extends Equatable {
  const LikeEvent();

  @override
  List<Object> get props => [];
}

//-----------------------------like Event-----------------------------
final class LikeUserAdded extends LikeEvent {
  final String likeId;
  LikeUserAdded({required this.likeId});
}

final class LikeUserRemoved extends LikeEvent {
  final String likeId;
  LikeUserRemoved({required this.likeId});
}

final class LikeUsersFetched extends LikeEvent {}
