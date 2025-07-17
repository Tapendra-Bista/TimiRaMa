part of 'setting_bloc.dart';

@freezed
abstract class SettingEvent with _$SettingEvent {
  const factory SettingEvent.started() = _Started;
  const factory SettingEvent.setToEnglish() = SetToEnglish;
  const factory SettingEvent.setFrance() = SetToFrance;
}
