part of 'preferences_bloc.dart';

//-State
@freezed
abstract class PreferencesState with _$PreferencesState {
  const factory PreferencesState({
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
  }) = _PreferencesState;

  factory PreferencesState.fromJson(Map<String, dynamic> json) =>
      _$PreferencesStateFromJson(json);
}
