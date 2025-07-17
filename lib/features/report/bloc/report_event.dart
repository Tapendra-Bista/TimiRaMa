part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.started() = _Started;
  const factory ReportEvent.violationChoosen({required String violation}) =
      ViolationChoosen;
  const factory ReportEvent.illegalChoosen({required String illegal}) =
      IllegalChoosen;
  const factory ReportEvent.agreeCondition({required bool agree}) =
      AgreeCondition;
}
