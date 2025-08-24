part of 'reel_bloc.dart';

//Event
@freezed
abstract class ReelEvent with _$ReelEvent {
  const factory ReelEvent.reelLoaded() = ReelLoaded;
}
