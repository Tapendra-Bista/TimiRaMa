
part of 'forgot_password_bloc.dart';


@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitial;
  // You can add other states like:
  // const factory ForgotPasswordState.loading() = ForgotPasswordLoading;
  // const factory ForgotPasswordState.success() = ForgotPasswordSuccess;
  // const factory ForgotPasswordState.error(String message) = ForgotPasswordError;
}
