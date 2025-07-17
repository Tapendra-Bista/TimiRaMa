part of 'wellcome_bloc.dart';

@freezed
abstract class WellcomeState with _$WellcomeState {
  const factory WellcomeState({@Default('fr') String languageCode}) = _WellcomeState;

  factory WellcomeState.fromJson(Map<String, dynamic> json) =>
      _$WellcomeStateFromJson(json);
}
