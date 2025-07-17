import 'package:timirama/features/add/screen/add_screen.dart';
import 'package:timirama/features/archive/screen/archive_screen.dart';
import 'package:timirama/features/block/screen/block_screen.dart';
import 'package:timirama/features/create_profile/screen/address_screen.dart';
import 'package:timirama/features/create_profile/screen/age_screen.dart';
import 'package:timirama/features/create_profile/screen/description_screen.dart';
import 'package:timirama/features/create_profile/screen/gender_screen.dart';
import 'package:timirama/features/create_profile/screen/interests_screen.dart';
import 'package:timirama/features/create_profile/screen/name_screen.dart';
import 'package:timirama/features/create_profile/screen/passion_screen.dart';
import 'package:timirama/features/create_profile/screen/upload_image_screen.dart';
import 'package:timirama/features/email_verification/screen/email_verification_screen.dart';
import 'package:timirama/features/favorite/screen/favorite_screen.dart';
import 'package:timirama/features/forgot_password/screen/email_sent_screen.dart';
import 'package:timirama/features/forgot_password/screen/forgot_password_screen.dart';
import 'package:timirama/features/login/screen/login_screen.dart';
import 'package:timirama/features/main/screen/main_screen.dart';
import 'package:timirama/features/match_preferences/screen/match_preferences.dart';
import 'package:timirama/features/messages_requests/screen/messages_requests_screen.dart';
import 'package:timirama/features/preferences/screen/preferences_screen.dart';
import 'package:timirama/features/profile/screen/profile_screen.dart';
import 'package:timirama/features/report/screen/report_screen.dart';
import 'package:timirama/features/report/screen/send_report_screen.dart';
import 'package:timirama/features/setting/screen/setting_screen.dart';
import 'package:timirama/features/signup/screen/signup_screen.dart';
import 'package:timirama/features/signup/widgets/condition_of_use.dart';
import 'package:timirama/features/signup/widgets/privacy_and_policy.dart';
import 'package:timirama/features/wellcome/screen/wellcome_screen.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';
import 'package:flutter/material.dart';

// Group all your screen imports here for clarity
final AppGetStorage _appGetStorage = AppGetStorage();
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen());

    case AppRoutes.privacyAndPolicy:
      return MaterialPageRoute(builder: (_) => PrivacyAndPolicy());

    case AppRoutes.conditionOfUse:
      return MaterialPageRoute(builder: (_) => ConditionOfUse());

    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case AppRoutes.forgotPassword:
      return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

    case AppRoutes.emailSent:
      return MaterialPageRoute(builder: (context) => EmailSentScreen());

    case AppRoutes.emailVerification:
      return MaterialPageRoute(builder: (_) => EmailVerificationScreen());

    case AppRoutes.wellcome:
      return MaterialPageRoute(builder: (_) => WellcomeScreen());

    case AppRoutes.main:
      return MaterialPageRoute(builder: (_) => MainScreen());

    case AppRoutes.name:
      return MaterialPageRoute(builder: (_) => NameScreen());
    case AppRoutes.gender:
      return MaterialPageRoute(builder: (_) => GenderScreen());
    case AppRoutes.age:
      return MaterialPageRoute(builder: (_) => AgeScreen());
    case AppRoutes.address:
      return MaterialPageRoute(builder: (_) => AddressScreen());
    case AppRoutes.interests:
      return MaterialPageRoute(builder: (_) => InterestsScreen());
    case AppRoutes.passion:
      return MaterialPageRoute(builder: (_) => PassionScreen());
    case AppRoutes.upload:
      return MaterialPageRoute(builder: (_) => UploadImageScreen());

    case AppRoutes.description:
      // Consolidated routes for CreateProfileBloc
      return MaterialPageRoute(builder: (_) => DescriptionScreen());

    case AppRoutes.setting:
      return MaterialPageRoute(builder: (_) => SettingScreen());
    case AppRoutes.sendReport:
      return MaterialPageRoute(builder: (_) => SendReportScreen());

    case AppRoutes.report:
      return MaterialPageRoute(builder: (_) => ReportScreen());
    case AppRoutes.profile:
      return MaterialPageRoute(builder: (_) => ProfileScreen());

    case AppRoutes.favorite:
      return MaterialPageRoute(builder: (_) => FavoriteScreen());

    case AppRoutes.archive:
      return MaterialPageRoute(builder: (_) => ArchiveScreen());

    case AppRoutes.block:
      return MaterialPageRoute(builder: (_) => BlockScreen());
    case AppRoutes.preferences:
      return MaterialPageRoute(builder: (_) => PreferencesScreen());
        case AppRoutes.matchPreferences:
      return MaterialPageRoute(builder: (_) => MatchPreferencesScreen());
    case AppRoutes.add:
      return MaterialPageRoute(builder: (_) => AddScreen());
    case AppRoutes.requests:
      return MaterialPageRoute(builder: (_) => RequestSenderScreen());
    default:
      return MaterialPageRoute(builder: (_) => WellcomeScreen());
  }
}

Widget routeNameFromPageNumber() {
  switch (_appGetStorage.getPageNumber()) {
    case 1:
      return EmailVerificationScreen();
    case 2:
      return NameScreen();
    case 3:
      return GenderScreen();
    case 4:
      return AgeScreen();
    case 5:
      return AddressScreen();
    case 6:
      return InterestsScreen();
    case 7:
      return PassionScreen();
    case 8:
      return DescriptionScreen();
    case 9:
      return UploadImageScreen();
    default:
      return MainScreen();
  }
}
