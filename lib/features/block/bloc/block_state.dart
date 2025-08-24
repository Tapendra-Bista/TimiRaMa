// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:timirama/features/block/model/block_model.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

//Block State
class BlockState extends Equatable {
  final BlockModel blockUserForChat;
  final List<ProfileModel> blockUserList;
  const BlockState({
    required this.blockUserList,
    required this.blockUserForChat,
  });

  @override
  List<Object> get props => [blockUserList];
}

final class BlockInitial extends BlockState {
  BlockInitial()
      : super(blockUserList: [], blockUserForChat: BlockModel.empty());
}

final class BlockUsersLoading extends BlockState {
  BlockUsersLoading()
      : super(blockUserList: [], blockUserForChat: BlockModel.empty());
}

final class BlockUsersError extends BlockState {
  final String errorMessage;

  BlockUsersError.fromState(BlockState state, {required this.errorMessage})
      : super(
          blockUserList: state.blockUserList,
          blockUserForChat: state.blockUserForChat,
        );

  @override
  List<Object> get props => [errorMessage];
}

final class BlockDataEmpty extends BlockState {
  BlockDataEmpty()
      : super(blockUserList: [], blockUserForChat: BlockModel.empty());
}
