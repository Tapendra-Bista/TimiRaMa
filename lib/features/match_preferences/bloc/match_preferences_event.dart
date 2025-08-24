part of 'match_preferences_bloc.dart';

@freezed
abstract class MatchPreferencesEvent with _$MatchPreferencesEvent {
  const factory MatchPreferencesEvent.genderMatchPreferencesRequested({
    @Default('') String men,
    @Default(false) bool isMenClicked,
    @Default('') String women,
    @Default(false) bool isWomenClicked,
  }) = GenderMatchPreferencesRequested;
  //Event
  const factory MatchPreferencesEvent.ageMatchPreferencesRequested(
    double start,
    double end,
  ) = AgeMatchPreferencesRequested;
  const factory MatchPreferencesEvent.locationMatchPreferencesRequested({
    @Default('') String country,
    @Default(false) bool isCountryClicked,
    @Default('') String city,
    @Default(false) bool isCityClicked,
  }) = LocationMatchPreferencesRequested;
}
