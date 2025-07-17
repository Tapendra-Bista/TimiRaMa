part of 'preferences_bloc.dart';

@freezed
abstract class PreferencesEvent with _$PreferencesEvent {
  const factory PreferencesEvent.genderPreferencesRequested({
    @Default('') String men,
    @Default(false) bool isMenClicked,
    @Default('') String women,
    @Default(false) bool isWomenClicked,
  }) = GenderPreferencesRequested;
//---------------Event---------------------
  const factory PreferencesEvent.agePreferencesRequested(
      double start, double end) = AgePreferencesRequested;
  const factory PreferencesEvent.locationPreferencesRequested({
    @Default('') String country,
    @Default(false) bool isCountryClicked,
    @Default('') String city,
    @Default(false) bool isCityClicked,
  }) = LocationPreferencesRequested;
}
