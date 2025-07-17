part of 'report_bloc.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = Initial;
  const factory ReportState.violation(String violation) = Violation;
  const factory ReportState.illegal(String illegal) = Illegal;
  const factory ReportState.agree(bool agree) = Agree;
}
