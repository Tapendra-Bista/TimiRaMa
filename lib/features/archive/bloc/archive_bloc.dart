import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/archive/bloc/archive_state.dart';
import 'package:timirama/features/archive/model/archive_model.dart';
import 'package:timirama/features/archive/repository/archive_repository.dart';
import 'package:timirama/features/home/repository/home_repository.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

//-----------------------Archive Bloc----------------------------
class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  final ArchiveRepository _archiveRepository;
  final HomeRepository _homeRepository = HomeRepository();
  ArchiveBloc({required ArchiveRepository repository})
    : _archiveRepository = repository,
      super(ArchiveInitial()) {
    on<ArchiveUserAdded>(_onArchiveUserAdded);

    on<ArchiveUserRemoved>(_onArchiveUserRemoved);

    on<ArchiveUsersFetched>(_onArchiveUsersFetched);
  }
  //-------------------------Fetching data----------------------------
  FutureOr<void> _onArchiveUsersFetched(
    ArchiveUsersFetched event,
    Emitter<ArchiveState> emit,
  ) async {
    emit(ArchiveUsersLoading());
    try {
      final ArchiveModel? data = await _archiveRepository.fetchArchives();
      final List<ProfileModel> homeModelData = await _homeRepository
          .fetchAllExceptCurrentUser();

      if (data != null) {
        final List<ProfileModel> favUserData = homeModelData
            .where((e) => e.id.isNotEmpty && data.archiveId.contains(e.id))
            .toList();
        emit(ArchiveState(favUserList: favUserData));
      } else {
        emit(ArchiveDataEmpty());
      }
    } catch (e) {
      emit(ArchiveUsersError.fromState(state, errorMessage: e.toString()));
    }
  }

  //-----------------------------Removing user from archive list-------------------------------------------
  FutureOr<void> _onArchiveUserRemoved(
    ArchiveUserRemoved event,
    Emitter<ArchiveState> emit,
  ) async {
    await _archiveRepository.removeArchive(event.archiveId);

    add(ArchiveUsersFetched());
  }

  //-------------------------------------Adding to archive list----------------------------------
  FutureOr<void> _onArchiveUserAdded(
    ArchiveUserAdded event,
    Emitter<ArchiveState> emit,
  ) async {
    await _archiveRepository.addArchive(event.archiveId);
    add(ArchiveUsersFetched());
  }
}
