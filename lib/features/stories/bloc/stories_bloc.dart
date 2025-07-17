import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/profile/repository/profile_repository.dart';
import 'package:timirama/features/stories/model/stories_model.dart';
import 'package:timirama/features/stories/repository/stories_repository.dart';

part 'stories_bloc.freezed.dart';
part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final StoriesRepository _storiesRepository;
  final ProfileRepository _profileRepository = ProfileRepository();
  StoriesModel _model = StoriesModel.empty();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  StoriesBloc({required StoriesRepository repo})
      : _storiesRepository = repo,
        super(
          StoriesState.initial(
            storiesData: [],
            currentUserStoriesData: StoriesFetchModel.empty(),
            profileData: ProfileModel.empty(),
          ),
        ) {
    on<StoriesImage>(_onStoriesImage);
    on<StoriesFetching>(_onFetching);
  }

  Future<void> _onStoriesImage(
    StoriesImage event,
    Emitter<StoriesState> emit,
  ) async {
    final image = await _storiesRepository.imagePickerForStories(event.source);
    if (image != null) {
      emit(
        StoriesState.posting(
          storiesData: state.storiesData,
          currentUserStoriesData: state.currentUserStoriesData,
          profileData: state.profileData,
        ),
      );

      final cloudinaryPath = await _storiesRepository.uploadStoriesToCloundinary(imagePath: image);
      final id = _auth.currentUser!.uid;
      Set<String> images = {cloudinaryPath};
      Set<Timestamp> date = {Timestamp.now()};

      _model = _model.copyWith(
        uid: id,
        userName: event.name,
        userImg: event.img,
        createdDate: date.toList(),
        containUrl: images.toList(),
      );
      print("Stroies poster ${event.name} and image ${event.img}");
      await _storiesRepository.uploadStoriesToFirebase(_model);

      emit(
        StoriesState.posted(
          storiesData: state.storiesData,
          currentUserStoriesData: state.currentUserStoriesData,
          profileData: state.profileData,
        ),
      );
    }
  }

  Future<void> _onFetching(
    StoriesFetching event,
    Emitter<StoriesState> emit,
  ) async {
    try {
      final currentUserId = _auth.currentUser!.uid;
      if (currentUserId.isEmpty) return;

      final profileData = await _profileRepository.fetchProfileData();
      final storiesData = await _storiesRepository.fetchAllStoriesData();

      final currentUserStoriesData = storiesData.firstWhere(
        (item) => item.id.isNotEmpty && item.id == currentUserId,
        orElse: () => StoriesFetchModel.empty(),
      );

      final fetchAllExceptCurrentUser = storiesData
          .where((item) => item.id.isNotEmpty && item.id != currentUserId)
          .toList();

      if (fetchAllExceptCurrentUser.isNotEmpty) {
        print("First user image: ${fetchAllExceptCurrentUser.first.userImg}");
      } else {
        print("No other user stories available.");
      }

      print("Current user story image: ${currentUserStoriesData.userImg}");
      print("Current user pseudo: ${profileData?.pseudo}");

      emit(
        StoriesState.storiesLoaded(
          storiesData: fetchAllExceptCurrentUser,
          currentUserStoriesData: currentUserStoriesData,
          profileData: profileData ?? ProfileModel.empty(),
        ),
      );
    } catch (e) {
      print("Error in Stories ................. ${e.toString()}");
    }
  }
}
