

part of 'stories_bloc.dart';
@freezed
abstract class StoriesEvent with _$StoriesEvent {
  const factory StoriesEvent.fetching() = StoriesFetching;
  const factory StoriesEvent.storiesImage({
    required String name,
    required String img,
    required ImageSource source,
  }) = StoriesImage;
}
