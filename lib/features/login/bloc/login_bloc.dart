import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:timirama/features/create_profile/repository/create_profile_repository.dart';
import 'package:timirama/features/login/bloc/login_event.dart';
import 'package:timirama/features/login/bloc/login_state.dart';
import 'package:timirama/features/login/models/login_model.dart';
import 'package:timirama/features/login/repository/login_repository.dart';
import 'package:timirama/services/storage/get_storage.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  final CreateProfileRepository _createProfileRepository =
      CreateProfileRepository();
  bool _isPasswordHidden = true;
  final _app = AppGetStorage();
  LoginModel _loginModel = LoginModel(email: '', password: '');

  LoginBloc({required LoginRepository loginrepository})
    : _loginRepository = loginrepository,
      super(LoginInitial()) {
    //---------------------password visibility-----------------------------
    on<LoginPasswordVisibility>((
      LoginPasswordVisibility event,
      Emitter<LoginState> emit,
    ) {
      _isPasswordHidden = !_isPasswordHidden;
      emit(state.copyWith(isLoginPasswordVisible: _isPasswordHidden));
    });
    //------------------------track user input for email--------------------------
    on<LoginEmailChanged>((event, emit) {
      _loginModel = _loginModel.copyWith(email: event.email);
    });
    //------------------------track user input for password--------------------------
    on<LoginPasswordChanged>((event, emit) {
      _loginModel = _loginModel.copyWith(password: event.password);
    });

    //------------------------User pressed LoginButton--------------------------
    on<LoginSubmit>((event, emit) async {
      print("User Location ${event.country} and ${event.city}");
      emit(LoginLoading.fromState(state));

      UserCredential? userCredential = await _loginRepository.loginWithEmail(
        _loginModel,
      );

      if (userCredential != null) {
        await _createProfileRepository.updateLocation(
          event.city,
          event.country,
        );

        emit(LoginSuccess.fromState(state));
      } else {
        emit(LoginError.fromState(state, error: _loginRepository.error!.tr));
      }
    });
    // -------------------google signing--------------------------------------
    on<GoogleSignInButtonClicked>((event, emit) async {
      emit(LoginLoading.fromState(state));

      final String? uid = await _loginRepository.loginWithGoogle();

      if (uid != null) {
        final bool userExists = await _loginRepository.isUserAvailable(uid);

        // Update location regardless
        await _createProfileRepository.updateLocation(
          event.city,
          event.country,
        );

        if (userExists) {
          emit(GoogleLoginOldUser.fromState(state));
        } else {
          emit(GoogleLoginNewUser.fromState(state));
          _app.setPageNumber(2);
        }
      } else {
        emit(
          GoogleLoginError.fromState(
            state,
            error: _loginRepository.error ?? 'Login failed',
          ),
        );
      }
    });
  }
}
