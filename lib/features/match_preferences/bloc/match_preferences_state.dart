part of 'match_preferences_bloc.dart';

//-------------------State---------------




@freezed
abstract class MatchPreferencesState with _$MatchPreferencesState {
  const factory MatchPreferencesState({
    @Default('') String men,
    @Default(false) bool isMenClicked,
    @Default('') String women,
    @Default(false) bool isWomenClicked,
    @Default(18.0) double start,
    @Default(60.0) double end,
    @Default('') String country,
    @Default('') String city,
    @Default(false) bool isCityClicked,
    @Default(false) bool isCountryClicked,
  }) = _MatchPreferencesState;

  factory MatchPreferencesState.fromJson(Map<String, dynamic> json) =>
      _$MatchPreferencesStateFromJson(json);
}
