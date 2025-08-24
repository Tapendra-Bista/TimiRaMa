import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/block/bloc/block_event.dart';
import 'package:timirama/features/block/bloc/block_state.dart';
import 'package:timirama/features/block/model/block_model.dart';
import 'package:timirama/features/block/repository/block_repository.dart';
import 'package:timirama/features/home/repository/home_repository.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

//Block Bloc
class BlockBloc extends Bloc<BlockEvent, BlockState> {
  final BlockRepository _blockRepository;
  final HomeRepository _homeRepository = HomeRepository();
  BlockBloc({required BlockRepository repository})
      : _blockRepository = repository,
        super(BlockInitial()) {
    on<BlockUserAdded>(_onblockUserAdded);

    on<BlockUserRemoved>(_onblockUserRemoved);

    on<BlockUsersFetched>(_onblockUsersFetched);
  }

  //-Fetching data-
  FutureOr<void> _onblockUsersFetched(
    BlockUsersFetched event,
    Emitter<BlockState> emit,
  ) async {
    emit(BlockUsersLoading());
    try {
      final BlockModel? data = await _blockRepository.fetchBlocks();
      final List<ProfileModel> homeModelData =
          await _homeRepository.fetchAllExceptCurrentUser();

      if (data != null) {
        final List<ProfileModel> blockUserData = homeModelData
            .where((e) => e.id.isNotEmpty && data.blockId.contains(e.id))
            .toList();
        emit(BlockState(blockUserList: blockUserData, blockUserForChat: data));
      } else {
        emit(BlockDataEmpty());
      }
    } catch (e) {
      emit(BlockUsersError.fromState(state, errorMessage: e.toString()));
    }
  }

  //Removing user from fav list
  FutureOr<void> _onblockUserRemoved(
    BlockUserRemoved event,
    Emitter<BlockState> emit,
  ) async {
    await _blockRepository.removeBlock(event.blockId);

    add(BlockUsersFetched());
  }

  //Adding to fav list
  FutureOr<void> _onblockUserAdded(
    BlockUserAdded event,
    Emitter<BlockState> emit,
  ) async {
    await _blockRepository.addBlock(event.blockId);
    add(BlockUsersFetched());
  }
}
