import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timirama/common/constant/profile_model_constants.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/services/base_repository.dart';
import 'dart:math';


class HomeRepository extends BaseRepository {
  HomeRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  Future<List<ProfileModel>> fetchAllExceptCurrentUser() async {
    try {
      if (currentUserId.isEmpty) return [];

      final snapshot = await firestore
          .collection('users')
          .where('id', isNotEqualTo: currentUserId)
          .get();

      return snapshot.docs
          .map((doc) => ProfileModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // Helper: Build vector for interest matching
  List<double> buildInterestVector(
    List<String> userInterests,
    List<String> allInterests,
  ) {
    return allInterests
        .map((interest) => userInterests.contains(interest) ? 1.0 : 0.0)
        .toList();
  }

  // Helper: Compute cosine similarity between two vectors
  double cosineSimilarity(List<double> a, List<double> b) {
    double dot = 0, magA = 0, magB = 0;
    for (int i = 0; i < a.length; i++) {
      dot += a[i] * b[i];
      magA += a[i] * a[i];
      magB += b[i] * b[i];
    }
    if (magA == 0 || magB == 0) return 0.0;
    return dot / (sqrt(magA) * sqrt(magB));
  }

  // Scoring users based on compatibility with currentUser's interests
  Future<List<ScoredProfileModel>> fetchUsersWithCompatibility(
    ProfileModel currentUser,
  ) async {
    final allUsers = await fetchAllExceptCurrentUser();
    final allInterests = ProfileModelConstants.allInterests.toSet().toList();

    final currentVector = buildInterestVector(
      currentUser.interests,
      allInterests,
    );

    final scoredUsers = allUsers.map((user) {
      final userVector = buildInterestVector(user.interests, allInterests);
      final score = cosineSimilarity(currentVector, userVector);
      return ScoredProfileModel(profile: user, score: score);
    }).toList();

    scoredUsers.sort((a, b) => b.score.compareTo(a.score)); // descending

    return scoredUsers;
  }
}

class ScoredProfileModel {
  final ProfileModel profile;
  final double score; // similarity score between 0.0 and 1.0

  ScoredProfileModel({required this.profile, required this.score});
}
