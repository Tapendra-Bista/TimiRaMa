import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState.initial()) {
    on<ViolationChoosen>(_onViolationChoosen);
    on<IllegalChoosen>(_onIllegalChoosen);
    on<AgreeCondition>(_onAgree);
  }

  _onViolationChoosen(ViolationChoosen event, Emitter<ReportState> emit) {
    print("From bloc ${event.violation}");
    emit(ReportState.violation(event.violation));
  }

  _onIllegalChoosen(IllegalChoosen event, Emitter<ReportState> emit) =>
      emit(ReportState.illegal(event.illegal));

  _onAgree(AgreeCondition event, Emitter<ReportState> emit) =>
      emit(ReportState.agree(event.agree));
}
