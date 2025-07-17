import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/app_logo.dart';
import 'package:timirama/common/widgets/loading.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/login/bloc/login_bloc.dart';
import 'package:timirama/features/login/bloc/login_state.dart';
import 'package:timirama/features/login/widgets/login_widgets.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/location/location.dart';
import 'package:timirama/services/storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppGetStorage _appGetStorage = AppGetStorage();
  @override
  void initState() {
    _initLocation();
    super.initState();
  }

  Future<void> _initLocation() async {
    try {
      final position = await UserLocation.determinePosition();
      final placemarks = await UserLocation.geoCoding(position);
      if (!mounted) return;
      _appGetStorage.setCity(placemarks.first.locality ?? '');
      _appGetStorage.setCountry(placemarks.first.country ?? '');
    } catch (e) {
      if (!mounted) return;
      // Optionally show an error message or fallback
      debugPrint('Location init error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: _listener,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ).copyWith(top: 20.h),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    // app logo image
                    SizedBox(height: 55.h),
                    //----- timirama logo------------
                    const AppLogo(),
                    SizedBox(height: 30.h),
                    //----------------text---------------
                    const LoginText(),
                    SizedBox(height: 10.h),
                    //--------------TextField For Email---------------
                    const LoginEmailInput(),
                    SizedBox(height: 10.h),
                    //--------------TextField For Password---------------
                    const LoginPasswordInput(),

                    //----------------Forget Password--------------------
                    const ForgotPassword(),
                    SizedBox(height: 45.h),
                    //   --------------------------Signup button and Login with Email Both Inside This ---------------------
                    LoginAndGoogleSigninButton(formKey: _formKey),
                    //------------------if user has already have account------------------
                    SizedBox(height: 3.h),
                    const DonotHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is LoginLoading) {
      customLoading(context);
      debugPrint("Loading>>>>>>>>>>>>");
    }

    if (state is LoginSuccess) {
      Get.back();
      debugPrint("Successs");
      snackBarMessage(
        context,
        EnumLocale.loginSuccessful.name.tr,
        Theme.of(context),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.main,
        (Route<dynamic> route) => false,
      );
    }
    if (state is LoginError) {
      Get.back();
      debugPrint("Error : ${state.error}");
      snackBarMessage(context, state.error, Theme.of(context));
    }

    if (state is GoogleLoginNewUser) {
      Get.back(); // Close dialog if any
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.name, // profile creation
        (route) => false,
      );
    }

    if (state is GoogleLoginOldUser) {
      Get.back();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.main, // main/home screen
        (route) => false,
      );
    }

    if (state is GoogleLoginError) {
      Get.back();
      snackBarMessage(context, state.error, Theme.of(context));
    }
  }
}
