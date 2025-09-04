import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/localization/translations/app_translations.dart';
import 'package:timirama/common/theme/app_theme.dart';
import 'package:timirama/features/add/bloc/add_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/follow/bloc/follow_bloc.dart';
import 'package:timirama/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/like/bloc/like_bloc.dart';
import 'package:timirama/features/login/bloc/login_bloc.dart';
import 'package:timirama/features/login/screen/login_screen.dart';
import 'package:timirama/features/match/bloc/match_bloc.dart';
import 'package:timirama/features/match_preferences/bloc/match_preferences_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_receiver_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_sender_bloc.dart';
import 'package:timirama/features/preferences/bloc/preferences_bloc.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_bloc.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';
import 'package:timirama/features/report/bloc/report_bloc.dart';
import 'package:timirama/features/setting/bloc/setting_bloc.dart';
import 'package:timirama/features/signup/bloc/signup_bloc.dart';
import 'package:timirama/features/stories/bloc/stories_bloc.dart';
import 'package:timirama/features/wellcome/bloc/wellcome_bloc.dart';
import 'package:timirama/features/wellcome/screen/wellcome_screen.dart';
import 'package:timirama/routes/app_pages.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:timirama/services/status/app_lifecycle_manager.dart';
import 'package:timirama/services/status/bloc/status_bloc.dart';
import 'package:timirama/services/status/repository/status_repository.dart';
import 'package:timirama/services/storage/get_storage.dart';

// Optimized with const constructor and better performance
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppGetStorage _appGetStorage = AppGetStorage();

    return MultiBlocProvider(
      providers: [
        //Bloc  Provider - Optimized with const constructors
        BlocProvider<WellcomeBloc>.value(value: getIt<WellcomeBloc>()),
        BlocProvider<SignupBloc>.value(value: getIt<SignupBloc>()),
        BlocProvider<LoginBloc>.value(value: getIt<LoginBloc>()),
        BlocProvider<ForgotPasswordBloc>.value(
            value: getIt<ForgotPasswordBloc>()),
        BlocProvider<BlockBloc>.value(value: getIt<BlockBloc>()),
        BlocProvider<ChatBloc>.value(value: getIt<ChatBloc>()),
        BlocProvider<StoriesBloc>.value(value: getIt<StoriesBloc>()),
        BlocProvider<CreateProfileBloc>.value(
            value: getIt<CreateProfileBloc>()),
        BlocProvider<ProfileBloc>.value(value: getIt<ProfileBloc>()),
        BlocProvider<FavoriteBloc>.value(value: getIt<FavoriteBloc>()),
        BlocProvider<LikeBloc>.value(value: getIt<LikeBloc>()),
        BlocProvider<FollowBloc>.value(value: getIt<FollowBloc>()),
        BlocProvider<ArchiveBloc>.value(value: getIt<ArchiveBloc>()),
        BlocProvider<StatusBloc>.value(value: getIt<StatusBloc>()),
        BlocProvider<HomeBloc>.value(value: getIt<HomeBloc>()),
        BlocProvider<ReportBloc>.value(value: getIt<ReportBloc>()),
        BlocProvider<PreferencesBloc>.value(value: getIt<PreferencesBloc>()),
        BlocProvider<MatchPreferencesBloc>.value(
            value: getIt<MatchPreferencesBloc>()),
        BlocProvider<ReelLikeBloc>.value(value: getIt<ReelLikeBloc>()),
        BlocProvider<ReelBloc>.value(value: getIt<ReelBloc>()),
        BlocProvider<AddBloc>.value(value: getIt<AddBloc>()),
        BlocProvider<RequestSenderBloc>.value(
            value: getIt<RequestSenderBloc>()),
        BlocProvider<RequestReceiverBloc>.value(
            value: getIt<RequestReceiverBloc>()),
        BlocProvider<EditProfileBloc>.value(value: getIt<EditProfileBloc>()),
        BlocProvider<SettingBloc>.value(value: getIt<SettingBloc>()),
        BlocProvider<MatchBloc>.value(value: getIt<MatchBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // iPhone X base
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => AppLifecycleManager(
          statusRepository: getIt<StatusRepository>(),
          child: GetMaterialApp(
            title: 'TimiRaMa',
            debugShowCheckedModeBanner: false,
            translations: AppTranslations(),
            locale: const Locale('en'),
            theme: lightTheme,
            defaultTransition: Transition.fade,
            onGenerateRoute: onGenerateRoute,
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const PlatformScaffold(); // or splash screen
                } else if (snapshot.hasData) {
                  return routeNameFromPageNumber();
                }
                return _appGetStorage.hasOpenedApp()
                    ? const LoginScreen()
                    : const WellcomeScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}
