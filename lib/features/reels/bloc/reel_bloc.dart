import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:timirama/features/block/repository/block_repository.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/features/reels/repository/reel_repository.dart';

part 'reel_bloc.freezed.dart';
part 'reel_bloc.g.dart';
part 'reel_event.dart';
part 'reel_state.dart';

// Bloc
class ReelBloc extends HydratedBloc<ReelEvent, ReelState> {
  final ReelRepository _reelRepository;
  final BlockRepository _blockRepository = BlockRepository();
  ReelBloc({required ReelRepository repository})
      : _reelRepository = repository,
        super(ReelState.initial()) {
    on<ReelLoaded>(_onReelLoaded);
  }

  /// fetch data
  Future<void> _onReelLoaded(ReelLoaded event, Emitter<ReelState> emit) async {
    try {
      // 1. Get all reels
      final List<ReelModel> reelModel = await _reelRepository.getReels();
      if (reelModel.isEmpty) {
        emit(ReelState.reelEmpty());
        return;
      }

      // 2. Get your block list
      final blockData = await _blockRepository.fetchBlocks();

      // 3. Get all unique reel owner IDs
      final reelUserIds = reelModel.map((e) => e.uid).toSet().toList();

      // 4. Check in batch if any of them has blocked you
      final blockedMap = await _blockRepository
          .fetchOtherUsersBlockListsInChunksFromIds(reelUserIds);

      // 5. Filter out reels where:
      //    a) You blocked them
      //    b) They blocked you

      final filteredReels = reelModel.where((reel) {
        final createdBy = reel.uid;
        final iBlocked = blockData?.blockId.contains(createdBy) ?? false;
        final theyBlockedMe =
            blockedMap[createdBy]?.contains(_blockRepository.currentUserId) ??
                false;
        return !iBlocked && !theyBlockedMe;
      }).toList();

      if (filteredReels.isEmpty) {
        emit(ReelState.reelEmpty());
      } else {
        emit(ReelState.initial(reelModel: filteredReels));
      }
    } catch (e) {
      emit(ReelState.reelError(errorMessage: e.toString()));
    }
  }

  @override
  ReelState? fromJson(Map<String, dynamic> json) {
    try {
      return ReelState.fromJson(json);
    } catch (e, stackTrace) {
      print('Error deserializing ReelState: $e');
      print('StackTrace: $stackTrace');
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ReelState state) {
    try {
      return state.toJson();
    } catch (e, stackTrace) {
      print('Error serializing ReelState: $e');
      print('StackTrace: $stackTrace');
      return null;
    }
  }
}
