import 'package:equatable/equatable.dart';

sealed class ReelLikeEvent extends Equatable {
  const ReelLikeEvent();

  @override
  List<Object> get props => [];
}

//-----------------------------reelLike Event-----------------------------
final class ReelLikeUserAdded extends ReelLikeEvent {
  final String reelLikeId;
  ReelLikeUserAdded({required this.reelLikeId});
}

final class ReelLikeUserRemoved extends ReelLikeEvent {
  final String reelLikeId;
  ReelLikeUserRemoved({required this.reelLikeId});
}

final class ReelLikeUsersFetched extends ReelLikeEvent {}
