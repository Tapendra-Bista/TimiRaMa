import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/profile/repository/profile_repository.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;
  ProfileBloc({required ProfileRepository repo})
    : _repository = repo,
      super(ProfileInitial()) {
    on<ProfileFetch>((event, emit) async {
      try {
        emit(Loading());
        final ProfileModel? data = await _repository.fetchProfileData();
        if (data != null) return emit(ProfileLoaded(data: data));
      } catch (e) {
        emit(Error(error: e.toString()));
      }
    });

    on<ProfileUpdate>(_onProfileUpdate);
  }

  Future<void> _onProfileUpdate(
    ProfileUpdate event,
    Emitter<ProfileState> emit,
  ) async {
    final ProfileModel? data = await _repository.fetchProfileData();
    if (data != null) return emit(ProfileLoaded(data: data));
  }
}
