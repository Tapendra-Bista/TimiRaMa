import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/email_verification/bloc/email_verification_bloc.dart';
import 'package:timirama/features/email_verification/bloc/email_verification_event.dart';
import 'package:timirama/features/email_verification/bloc/email_verification_state.dart';
import 'package:timirama/features/email_verification/repository/email_verification_repository.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:timirama/services/storage/get_storage.dart';

// --------------Email verification button----------------------------------
class EmailVerificationButton extends StatelessWidget {
  EmailVerificationButton({super.key});

  final repository = EmailVerificationRepository();

  final appGetStorage = AppGetStorage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
      builder: (context, state) {
        return CommonButton(
          onPressed: () async {
            if (state.isVerified) {
              final BuildContext currentContext = context;
              final isVerified = await repository.isEmailVerified();
              if (!currentContext.mounted) return;

              if (isVerified) {
                Get.toNamed(AppRoutes.name);

                appGetStorage.setPageNumber(2);
              } else {
                snackBarMessage(
                  context,
                  EnumLocale.emailVerifyRequired.name.tr,
                  Theme.of(context),
                );
              }
            } else {
              context.read<EmailVerificationBloc>().add(OnButtonClicked());
            }
          },
          buttonText: state.isVerified
              ? EnumLocale.next.name.tr
              : EnumLocale.verifyYourEmailText.name.tr,
        );
      },
    );
  }
}

//----------------Next Button------------------------

//---------------Image of  email at center-------------------------------
class EmailVerificationImage extends StatelessWidget {
  const EmailVerificationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppStrings.email, height: 200.h, width: 300.w),
    );
  }
}

//---------------email verification body text-------------------------------
class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.verifyEmailBody.name.tr, style: theme.bodySmall);
  }
}

//---------------email verification title text-------------------------------
class EmailVerificationTitle extends StatelessWidget {
  const EmailVerificationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.verifyEmailTitle.name.tr, style: theme.bodyLarge);
  }
}

//--------------- delete account  text-------------------------------
class EmailVerificationDeleteAccount extends StatelessWidget {
  const EmailVerificationDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        text: TextSpan(
          text: EnumLocale.deleteAccountText.name.tr,
          style: theme.bodySmall!.copyWith(fontSize: 14),
          children: [
            TextSpan(
              text: EnumLocale.delete.name.tr,
              style: theme.bodySmall!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 14,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.read<EmailVerificationBloc>().add(
                    OnClickedDeleteButton(),
                  );
                  GetStorage().remove('pageNumber');
                  getIt.resetLazySingleton<EmailVerificationBloc>();
                },
            ),
          ],
        ),
      ),
    );
  }
}
