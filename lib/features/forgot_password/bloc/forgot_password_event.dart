

part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.userEmail({required String userEmail}) = UserEmail;
  const factory ForgotPasswordEvent.sendButtonClicked() = SendButtonClicked;
}
