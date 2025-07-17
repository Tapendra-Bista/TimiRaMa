import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/features/edit_profile/repository/edit_profile_repository.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileRepository _editProfileRepositoryl;
  EditProfileBloc({required EditProfileRepository repository})
    : _editProfileRepositoryl = repository,
      super(_Initial()) {
    on<ReplaceImage>(_onPickImage);
  }

  Future<void> _onPickImage(
    ReplaceImage event,
    Emitter<EditProfileState> emit,
  ) async {
    final imageUrl =
        await _editProfileRepositoryl.pickImage(event.imageSource) ?? '';

    if (imageUrl.isNotEmpty) {
      emit(EditProfileState.uploading());
      final cloudinaryUrl = await _editProfileRepositoryl.uploadToCloudinary(
        imageUrl,
      );
      await _editProfileRepositoryl.replacePicInFirebase(cloudinaryUrl);
      emit(EditProfileState.uploaded());
    }
  }
}
