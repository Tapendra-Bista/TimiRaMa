// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:timirama/features/reel_like/model/reel_like_model.dart';

//-----------------------------reelLike State-----------------------------
class ReelLikeState extends Equatable {
  final ReelLikeModel reelLikeUserList;
  const ReelLikeState({required this.reelLikeUserList});

  @override
  List<Object> get props => [reelLikeUserList];
}

final class ReelLikeInitial extends ReelLikeState {
  ReelLikeInitial() : super(reelLikeUserList: ReelLikeModel.empty());
}

final class ReelLikeUsersLoading extends ReelLikeState {
  ReelLikeUsersLoading() : super(reelLikeUserList: ReelLikeModel.empty());
}

final class ReelLikeUsersError extends ReelLikeState {
  final String errorMessage;

  ReelLikeUsersError.fromState(
    ReelLikeState state, {
    required this.errorMessage,
  }) : super(reelLikeUserList: state.reelLikeUserList);

  @override
  List<Object> get props => [errorMessage];
}

final class ReelLikeDataEmpty extends ReelLikeState {
  ReelLikeDataEmpty() : super(reelLikeUserList: ReelLikeModel.empty());
}
