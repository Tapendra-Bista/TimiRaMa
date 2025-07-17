import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/services/base_repository.dart';

//----------------Fetching current  user profile data
class ProfileRepository extends BaseRepository {
  ProfileRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  Future<ProfileModel?> fetchProfileData() async {
    try {
      if (currentUserId.isEmpty) return null;

      final DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('users')
          .doc(currentUserId)
          .get();

      if (snapshot.exists) {
        return ProfileModel.fromJson(snapshot.data()!);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
