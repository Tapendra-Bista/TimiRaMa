part of 'stories_bloc.dart';

@freezed
abstract class StoriesState with _$StoriesState {
  const factory StoriesState.storiesLoaded({
        required List<StoriesFetchModel> storiesData,
    required StoriesFetchModel currentUserStoriesData,
    required ProfileModel profileData,
  }) = StoriesLoaded;

  const factory StoriesState.initial({
        required List<StoriesFetchModel> storiesData,
    required StoriesFetchModel currentUserStoriesData,
    required ProfileModel profileData,
  }) = _Initial;
  const factory StoriesState.posting({
        required List<StoriesFetchModel> storiesData,
    required StoriesFetchModel currentUserStoriesData,
    required ProfileModel profileData,
  }) = Posting;
  const factory StoriesState.posted({
        required List<StoriesFetchModel> storiesData,
    required StoriesFetchModel currentUserStoriesData,
    required ProfileModel profileData,
  }) = Posted;
}
