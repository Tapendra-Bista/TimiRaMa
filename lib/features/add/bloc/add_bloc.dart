import 'dart:async';
import 'package:timirama/features/add/repository/add_repository.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/profile/repository/profile_repository.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'add_bloc.freezed.dart';
part 'add_event.dart';
part 'add_state.dart';

//--------- add bloc for reel post ---------
class AddBloc extends Bloc<AddEvent, AddState> {
  final AddRepository _addRepository;
  final Uuid _uuid = Uuid();
  AddBloc({required AddRepository repository})
    : _addRepository = repository,
      super(AddState()) {
    on<PickVideo>(_onVideoPicked);
    on<RecordVideo>(_onRecordVideo);
    on<PostReel>(_onPostReel);
  }
  //-----------video picker--------------
  Future<void> _onVideoPicked(PickVideo event, Emitter<AddState> emit) async {
    final url = await _addRepository.videoPicker() ?? '';
    if (url.isNotEmpty) emit(AddState.validUrl(videoUrl: url));
    print("Video Url : ${url}");
  }

  _onRecordVideo(RecordVideo event, Emitter<AddState> emit) =>
      emit(AddState.validUrl(videoUrl: event.videoPath));

  Future<void> _onPostReel(PostReel event, Emitter<AddState> emit) async {
    try {
      emit(AddState.loading());
      // video path
      final String videoPath = await _addRepository.postVideoInCloudinary(
        event.trimVideoUrl,
      );
      // profile details
      final ProfileModel? profileModel = await getIt<ProfileRepository>()
          .fetchProfileData();
      final ReelModel reelModel = ReelModel(
        uid: profileModel!.id,
        rid: _uuid.v4(),
        reelUrl: videoPath,
        profileImage: profileModel.imgURL,
        name: profileModel.pseudo,
        description: event.description,
      );
      await _addRepository.addToFirebase(reelModel);
      emit(AddState.success());
    } catch (e) {
      emit(AddState.error(errorMessage: e.toString()));
    }
  }
}
