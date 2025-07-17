import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/features/forgot_password/model/forgot_password_model.dart';
import 'package:timirama/features/forgot_password/repository/forgot_password_repository.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

//----------------------Bloc for forgot password screen-----------------------------------
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  // Make repository private
  final ForgotPasswordRepository _repository;
  // Make model private
  ForgotPasswordModel _model = ForgotPasswordModel(email: "");
  ForgotPasswordBloc({required ForgotPasswordRepository repo})
    : _repository = repo,
      super(ForgotPasswordInitial()) {
    //-------------------------User email ------------------------
    on<UserEmail>((event, emit) {
      _model = _model.copyWith(email: event.userEmail);
    });
    // --------------------------Button clicked than this run----------------------------
    on<SendButtonClicked>((event, emit) async {
      try {
        await _repository.sendEmailToRestPassword(_model);
      } catch (e) {}
    });
  }
}
