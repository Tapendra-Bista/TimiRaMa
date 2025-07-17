// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:timirama/features/like/model/like_model.dart';

//-----------------------------like State-----------------------------
class LikeState extends Equatable {
  final LikeModel likeUserList;
  const LikeState({required this.likeUserList});

  @override
  List<Object> get props => [likeUserList];
}

final class LikeInitial extends LikeState {
  LikeInitial() : super(likeUserList: LikeModel.empty());
}

final class LikeUsersLoading extends LikeState {
  LikeUsersLoading() : super(likeUserList: LikeModel.empty());
}

final class LikeUsersError extends LikeState {
  final String errorMessage;

  LikeUsersError.fromState(LikeState state, {required this.errorMessage})
    : super(likeUserList: state.likeUserList);

  @override
  List<Object> get props => [errorMessage];
}

final class LikeDataEmpty extends LikeState {
  LikeDataEmpty() : super(likeUserList: LikeModel.empty());
}
