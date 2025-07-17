part of 'setting_bloc.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.getEnglish() = GetEnglish;
  const factory SettingState.getFrance() = GetFrance;
}
