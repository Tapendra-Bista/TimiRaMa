part of 'edit_profile_bloc.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.uploading() = Uploading;
  const factory EditProfileState.uploaded() = Uploaded;
}
