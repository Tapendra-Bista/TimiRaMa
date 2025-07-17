part of 'add_bloc.dart';

@freezed
abstract class AddEvent with _$AddEvent {
  const factory AddEvent.started() = _Started;
  const factory AddEvent.pickVideo() = PickVideo;
  const factory AddEvent.recordVideo({required String videoPath}) = RecordVideo;
  const factory AddEvent.post({required String trimVideoUrl, required  String  description}) = PostReel;
}
