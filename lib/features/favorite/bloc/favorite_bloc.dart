import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_event.dart';
import 'package:timirama/features/favorite/bloc/favorite_state.dart';
import 'package:timirama/features/favorite/model/favorite_model.dart';
import 'package:timirama/features/favorite/repository/favorite_repository.dart';
import 'package:timirama/features/home/repository/home_repository.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _favouriteRepository;
  final HomeRepository _homeRepository = HomeRepository();
  FavoriteBloc({required FavoriteRepository repository})
    : _favouriteRepository = repository,
      super(FavoriteInitial()) {
    on<FavoriteUserAdded>(_onFavoriteUserAdded);

    on<FavoriteUserRemoved>(_onFavoriteUserRemoved);

    on<FavoriteUsersFetched>(_onFavoriteUsersFetched);
  }
  //-------------------------Fetching data----------------------------
  FutureOr<void> _onFavoriteUsersFetched(
    FavoriteUsersFetched event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteUsersLoading());
    try {
      final FavoriteModel? data = await _favouriteRepository.fetchFavorites();
      final List<ProfileModel> homeModelData = await _homeRepository
          .fetchAllExceptCurrentUser();

      if (data != null) {
        final List<ProfileModel> favUserData = homeModelData
            .where((e) => e.id.isNotEmpty && data.favId.contains(e.id))
            .toList();
        emit(FavoriteState(favUserList: favUserData));
      } else {
        emit(FavoriteDataEmpty());
      }
    } catch (e) {
      emit(FavoriteUsersError.fromState(state, errorMessage: e.toString()));
    }
  }

  //-----------------------------Removing user from fav list-------------------------------------------
  FutureOr<void> _onFavoriteUserRemoved(
    FavoriteUserRemoved event,
    Emitter<FavoriteState> emit,
  ) async {
    await _favouriteRepository.removeFavorite(event.favId);

    add(FavoriteUsersFetched());
  }

  //-------------------------------------Adding to fav list----------------------------------
  FutureOr<void> _onFavoriteUserAdded(
    FavoriteUserAdded event,
    Emitter<FavoriteState> emit,
  ) async {
    await _favouriteRepository.addFavorite(event.favId);
    add(FavoriteUsersFetched());
  }
}
