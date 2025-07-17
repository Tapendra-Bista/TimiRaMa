part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded({required ProfileModel data}) =
      ProfileLoaded;
  const factory ProfileState.error({required String error}) = Error;
}
