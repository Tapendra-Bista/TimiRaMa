part of 'match_bloc.dart';

@freezed
class MatchState with _$MatchState {
  const factory MatchState.initial() = _Initial;


  const factory MatchState.success({
    required bool isMutualMatch,
  required    String matchedUserId,
 required String matchedUserName,
 required String matchedUserImage,

  }) = Success;

  const factory MatchState.failure({
    required String error,
  }) = Failure;
}

