import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/login/models/login_model.dart';
import 'package:timirama/services/base_repository.dart';

// -------------------------Login logic-----------------------------
class LoginRepository extends BaseRepository {
  String? error;

  LoginRepository({FirebaseAuth? firebaseauth}) {
    auth = firebaseauth ?? FirebaseAuth.instance;
  }

  //-----------------Email Links (PasswordLess Auth)----------------
  Future<void> sendSignInLink(String email) async {
    try {
      final ActionCodeSettings acs = ActionCodeSettings(
        url:
            'https://timirama-e0b18.web.app', // Your app’s domain or deep link route
        handleCodeInApp: true,
        androidPackageName: "com.example.timirama",
        androidInstallApp: true,
        androidMinimumVersion: '21',
        iOSBundleId: "com.example.timirama",
      );

      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: acs,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //------------------------------login with Email ------------------------------------------
  Future<UserCredential?> loginWithEmail(LoginModel loginModel) async {
    try {
      final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      debugPrint("Current user ID :${credential.user!.uid}");
      return credential;
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Exception: ${e.code} - ${e.message}');
      null; // Important: clear the credential if login fails!

      if (e.code == 'user-not-found') {
        error = EnumLocale.userNotFoundError.name.tr;
      } else if (e.code == 'wrong-password') {
        error = EnumLocale.wrongPasswordError.name.tr;
      } else {
        error = EnumLocale.wrongCredential.name.tr;
      }
    }
    return null;
  }

  //----------------------login with google----------------------------
  Future<String?> loginWithGoogle() async {
    try {
      // Step 1: Initialize the singleton once
      await GoogleSignIn.instance.initialize();

      // Step 2: Authenticate the user
      final googleUser = await GoogleSignIn.instance.authenticate(
          // Optional: request additional scopes right here
          // scopeHint: ['email', 'profile'],
          );

      // Step 3: Get GoogleAuth tokens
      final googleAuth = await googleUser.authentication;

      // Step 4: Build Firebase credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return userCredential.user!.uid;
    } catch (e) {
      error = e.toString();

      debugPrint(e.toString());

      //
    }
    return null;
  }

  //-------------------- checking if user available or not---------------------
  Future<bool> isUserAvailable(String uid) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      return snapshot.exists;
    } catch (e) {
      debugPrint('isUserAvailable error: $e');
      return false;
    }
  }
}
