import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timirama/services/base_repository.dart';
import 'package:timirama/services/storage/get_storage.dart';

class EmailVerificationRepository extends BaseRepository {
  final AppGetStorage appGetStorage = AppGetStorage();
  //------------------To control delete , emailverification----------------------------
  EmailVerificationRepository({FirebaseAuth? auth}) {
    this.auth = auth ?? FirebaseAuth.instance;
  }
  //----------------------Sending link for email verification--------------------------
  Future<void> sendEmailVerificationLink() async {

    final currentUser = auth.currentUser;
    try {
      if (!currentUser!.emailVerified) {
        await currentUser.sendEmailVerification();
      }
    } catch (e) {
      debugPrint("Error: in email verifcation ${e.toString()}");

      rethrow;
    }
  }

  //--------------checking whether user verified or not email-----------------------
  Future<bool> isEmailVerified() async {
    await auth.currentUser!.reload();
    return auth.currentUser!.emailVerified;
  }

  Future deleteAccount() async {
    await auth.currentUser!.delete();
  }
}
