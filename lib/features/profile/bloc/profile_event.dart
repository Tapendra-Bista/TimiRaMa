part of 'profile_bloc.dart';

@freezed
   abstract  class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetch() = ProfileFetch;
  const factory ProfileEvent.update() = ProfileUpdate;
}
