import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/utils/validators.dart';
import 'package:timirama/common/widgets/common_textfield.dart';
import 'package:timirama/features/login/bloc/login_bloc.dart';
import 'package:timirama/features/login/bloc/login_event.dart';
import 'package:timirama/features/login/bloc/login_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';

// Optimized with proper controller disposal and const constructors
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners for better performance
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    // Properly dispose controllers to prevent memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    context
        .read<LoginBloc>()
        .add(LoginEmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    context
        .read<LoginBloc>()
        .add(LoginPasswordChanged(password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return PlatformScaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and title
                  const LoginLogo(),
                  SizedBox(height: 30.h),
                  const LoginTitle(),
                  SizedBox(height: 50.h),

                  // Email field
                  RepaintBoundary(
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: EnumLocale.emailHint.name.tr,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Password field
                  RepaintBoundary(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: EnumLocale.passwordHint.name.tr,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Login button
                  RepaintBoundary(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : Text(
                                EnumLocale.loginText.name.tr,
                                style: theme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Forgot password and signup links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                        child: Text(EnumLocale.forgotPassword.name.tr),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.signup),
                        child: Text(EnumLocale.signupText.name.tr),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      // Use the existing LoginSubmit event with city and country
      final appGetStorage = AppGetStorage();
      context.read<LoginBloc>().add(LoginSubmit(
            city: appGetStorage.getCity(),
            country: appGetStorage.getCountry(),
          ));
    }
  }
}

// Optimized with const constructor
class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons
          .favorite, // Using a standard icon instead of non-existent HugeIcons.strokeRoundedLogo
      size: 80,
      color: AppColors.primaryColor,
    );
  }
}

// Optimized with const constructor
class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.welcome.name.tr, // Changed from welcomeBack to welcome
      style: theme.headlineMedium!.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// - Signup text -
class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.loginText.name.tr, style: theme.bodyLarge);
  }
}

///  TextField for email -
class LoginEmailInput extends StatefulWidget {
  const LoginEmailInput({super.key});

  @override
  State<LoginEmailInput> createState() => _LoginEmailInputState();
}

class _LoginEmailInputState extends State<LoginEmailInput> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      labelText: EnumLocale.emailHint.name.tr,
      controller: _emailController,
      validator: AppValidator.validateEmail,
      obscureText: false,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email: value.trim())),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

///  TextField for password -
class LoginPasswordInput extends StatefulWidget {
  const LoginPasswordInput({super.key});

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CommonTextField(
          labelText: EnumLocale.passwordHint.name.tr,
          controller: _passwordController,
          validator: AppValidator.validateLoginPassword,
          obscureText: state.isLoginPasswordVisible,
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value.trim()),
              ),
          suffixIcon: PlatformIconButton(
            onPressed: () =>
                context.read<LoginBloc>().add(LoginPasswordVisibility()),
            icon: Icon(
              state.isLoginPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

///  Login button -
class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  final AppGetStorage _appGetStorage = AppGetStorage();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40.h, // Slightly increased height for better touch target
        width: 120.w,
        child: ElevatedButton(
          // Using ElevatedButton for better default styling
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(
                    LoginSubmit(
                      city: _appGetStorage.getCity(),
                      country: _appGetStorage.getCountry(),
                    ),
                  );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Container(
              padding: EdgeInsets.all(3.r),
              alignment: Alignment.center,
              child: Text(
                EnumLocale.loginText.name.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
              ),

              // Show indicator if loading and it's the login button
            ),
          ),
        ),
      ),
    );
  }
}

//if user doesnot have account

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        text: TextSpan(
          text: EnumLocale.doNotHaveAccount.name.tr,
          style: theme.bodySmall!.copyWith(fontSize: 16),
          children: [
            TextSpan(
              text: EnumLocale.signupText.name.tr,
              style: theme.bodySmall!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.toNamed(AppRoutes.signup),
            ),
          ],
        ),
      ),
    );
  }
}

//-Button for google login

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({super.key});
  final AppGetStorage _appGetStorage = AppGetStorage();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40.h, // Slightly increased height for better touch target
        width: 120.w,
        child: ElevatedButton(
          // Using ElevatedButton for better default styling
          onPressed: () => context.read<LoginBloc>().add(
                GoogleSignInButtonClicked(
                  city: _appGetStorage.getCity(),
                  country: _appGetStorage.getCountry(),
                ),
              ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Container(
              padding: EdgeInsets.all(6.r),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppStrings.googleLogo),

              // Show indicator if loading and it's the login button
            ),
          ),
        ),
      ),
    );
  }
}

//-Login Button and Google Signin Button
class LoginAndGoogleSigninButton extends StatelessWidget {
  const LoginAndGoogleSigninButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        LoginButton(formKey: formKey),
        GoogleSignInButton(),
      ],
    );
  }
}

//Forgot password
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.forgotPassword),
        child: Text(
          EnumLocale.forgotPassword.name.tr,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
