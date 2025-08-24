// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:timirama/features/follow/model/follow_model.dart';

//Follow State
class FollowState extends Equatable {
  final FollowModel followUserList;

  const FollowState({required this.followUserList});

  @override
  List<Object> get props => [followUserList];
}

final class FollowInitial extends FollowState {
  FollowInitial() : super(followUserList: FollowModel.empty());
}

final class FollowUsersLoading extends FollowState {
  FollowUsersLoading() : super(followUserList: FollowModel.empty());
}

final class FollowUsersError extends FollowState {
  final String errorMessage;

  FollowUsersError.fromState(FollowState state, {required this.errorMessage})
      : super(followUserList: state.followUserList);

  @override
  List<Object> get props => [errorMessage];
}

final class FollowDataEmpty extends FollowState {
  FollowDataEmpty() : super(followUserList: FollowModel.empty());
}
