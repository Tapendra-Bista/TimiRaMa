part of 'wellcome_bloc.dart';

@freezed
abstract class WellcomeEvent with _$WellcomeEvent {
  const factory WellcomeEvent.changeLanguage({required String languageCode}) =
      ChangeLanguage;
}
