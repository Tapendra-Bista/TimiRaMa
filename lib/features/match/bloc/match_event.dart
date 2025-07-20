part of 'match_bloc.dart';

@freezed
   abstract class MatchEvent with _$MatchEvent {
  const factory MatchEvent.started() = _Started;

    const factory MatchEvent.handleRightSwipe({
    required String swipedUserId,
  required    String matchedUserId,
 required String matchedUserName,
 required String matchedUserImage,

  }) = HandleRightSwipe;
}


