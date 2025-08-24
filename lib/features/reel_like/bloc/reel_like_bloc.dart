import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_event.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_state.dart';
import 'package:timirama/features/reel_like/model/reel_like_model.dart';
import 'package:timirama/features/reel_like/repository/reel_like_repository.dart';

class ReelLikeBloc extends HydratedBloc<ReelLikeEvent, ReelLikeState> {
  final ReelLikeRepository _reelLikeRepository;

  ReelLikeBloc({required ReelLikeRepository repository})
      : _reelLikeRepository = repository,
        super(ReelLikeInitial()) {
    on<ReelLikeUserAdded>(_onReelLikeUserAdded);

    on<ReelLikeUserRemoved>(_onReelLikeUserRemoved);

    on<ReelLikeUsersFetched>(_onReelLikeUsersFetched);
  }
  //-Fetching data-
  FutureOr<void> _onReelLikeUsersFetched(
    ReelLikeUsersFetched event,
    Emitter<ReelLikeState> emit,
  ) async {
    try {
      final ReelLikeModel? reelLikeUserData =
          await _reelLikeRepository.fetchReelLikes();

      if (reelLikeUserData != null) {
        emit(ReelLikeState(reelLikeUserList: reelLikeUserData));
      } else {
        emit(ReelLikeDataEmpty());
      }
    } catch (e) {
      emit(ReelLikeUsersError.fromState(state, errorMessage: e.toString()));
    }
  }

  //Removing user from reelLike list
  FutureOr<void> _onReelLikeUserRemoved(
    ReelLikeUserRemoved event,
    Emitter<ReelLikeState> emit,
  ) async {
    await _reelLikeRepository.removeReelLike(event.reelLikeId);

    add(ReelLikeUsersFetched());
  }

  //Adding to reelLike list
  FutureOr<void> _onReelLikeUserAdded(
    ReelLikeUserAdded event,
    Emitter<ReelLikeState> emit,
  ) async {
    await _reelLikeRepository.addReelLike(event.reelLikeId);
    add(ReelLikeUsersFetched());
  }

  @override
  ReelLikeState? fromJson(Map<String, dynamic> json) {
    try {
      final reelLikeUserData = (json['reelLikeUserData'] as ReelLikeModel);

      return ReelLikeState(reelLikeUserList: reelLikeUserData);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ReelLikeState state) {
    try {
      return {'reelLikeUserData': state.reelLikeUserList.toJson()};
    } catch (e) {
      return null;
    }
  }
}
