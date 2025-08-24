import 'package:firebase_auth/firebase_auth.dart';
import 'package:timirama/features/forgot_password/model/forgot_password_model.dart';
import 'package:timirama/services/base_repository.dart';
import 'package:timirama/services/storage/get_storage.dart';

// Repository for FP screen
class ForgotPasswordRepository extends BaseRepository {
  final AppGetStorage appGetStorage = AppGetStorage();

  ForgotPasswordRepository({FirebaseAuth? firebaseAuth});

  Future sendEmailToRestPassword(ForgotPasswordModel model) async {
    try {
      await auth.sendPasswordResetEmail(email: model.email);
    } catch (e) {
      rethrow;
    }
  }
}
