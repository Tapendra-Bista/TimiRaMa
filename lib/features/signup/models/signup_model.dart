import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_model.freezed.dart';

@freezed
  abstract  class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    required String email,
    required String password,
  }) = _SignUpModel;
}


