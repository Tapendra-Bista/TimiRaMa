import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/email_verification/bloc/email_verification_event.dart';
import 'package:timirama/features/email_verification/bloc/email_verification_state.dart';
import 'package:timirama/features/email_verification/repository/email_verification_repository.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final EmailVerificationRepository _repository;
  EmailVerificationBloc({required EmailVerificationRepository repository})
    : _repository = repository,
      super(EmailVerificationInitial()) {
    //------------when user clicked send link button for verification----------------------------------

    on<OnButtonClicked>((event, emit) async {
      try {
        await _repository.sendEmailVerificationLink();
        emit(state.copyWith(isVerified: true));
      } catch (e) {
        emit(EmailVerifiedError.fromState(state, error: e.toString()));
      }
    });
    //---------------------Delete Account--------------------------------
    on<OnClickedDeleteButton>((event, emit) async {
      try {
        await _repository.deleteAccount();
        emit(AccountDelete.fromState(state));
      } catch (e) {
        emit(EmailVerifiedError.fromState(state, error: e.toString()));
      }
    });
  }
}
