//- Model for forgot password
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_model.freezed.dart';

@freezed
abstract class ForgotPasswordModel with _$ForgotPasswordModel {
  const factory ForgotPasswordModel({
    required String email,
  }) = _ForgotPasswordModel;
}
