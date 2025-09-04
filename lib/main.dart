import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timirama/app.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/firebase_options.dart';
import 'package:timirama/services/notification/notification_service.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Notification service
  await NotificationService().initNotifications(); 
  

  // Get storage
  await GetStorage.init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.floralWhite,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

//Important-
//https://timirama-e0b18.web.app/.well-known/assetlinks.json
// https://timirama-e0b18.web.app/
// https://timirama-e0b18.web.app/        

// cmd to generate SH1 key
// keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore | openssl sha1 -binary | openssl base64
// .android/debug.keystore
// .build/app/outputs/flutter-apk/app-debug.apk
// .build/app/outputs/flutter-apk/app-release.apk
// .build/app/outputs/flutter-apk/app-release.apk 