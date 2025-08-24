import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:timirama/features/like/bloc/like_event.dart';
import 'package:timirama/features/like/bloc/like_state.dart';
import 'package:timirama/features/like/model/like_model.dart';
import 'package:timirama/features/like/repository/like_repository.dart';

class LikeBloc extends HydratedBloc<LikeEvent, LikeState> {
  final LikeRepository _likeRepository;

  LikeBloc({required LikeRepository repository})
      : _likeRepository = repository,
        super(LikeInitial()) {
    on<LikeUserAdded>(_onLikeUserAdded);

    on<LikeUserRemoved>(_onLikeUserRemoved);

    on<LikeUsersFetched>(_onLikeUsersFetched);
  }
  //-Fetching data-
  FutureOr<void> _onLikeUsersFetched(
    LikeUsersFetched event,
    Emitter<LikeState> emit,
  ) async {
    try {
      final LikeModel? likeUserData = await _likeRepository.fetchLikes();

      if (likeUserData != null) {
        emit(LikeState(likeUserList: likeUserData));
      } else {
        emit(LikeDataEmpty());
      }
    } catch (e) {
      emit(LikeUsersError.fromState(state, errorMessage: e.toString()));
    }
  }

  //Removing user from like list
  FutureOr<void> _onLikeUserRemoved(
    LikeUserRemoved event,
    Emitter<LikeState> emit,
  ) async {
    await _likeRepository.removeLike(event.likeId);

    add(LikeUsersFetched());
  }

  //Adding to like list
  FutureOr<void> _onLikeUserAdded(
    LikeUserAdded event,
    Emitter<LikeState> emit,
  ) async {
    await _likeRepository.addLike(event.likeId);
    add(LikeUsersFetched());
  }

  @override
  LikeState? fromJson(Map<String, dynamic> json) {
    try {
      final likeUserData = (json['likeUserData'] as LikeModel);

      return LikeState(likeUserList: likeUserData);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LikeState state) {
    try {
      return {'likeUserData': state.likeUserList.toJson()};
    } catch (e) {
      return null;
    }
  }
}
