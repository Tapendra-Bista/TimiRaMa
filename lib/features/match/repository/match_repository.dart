import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timirama/features/match/model/match_model.dart';
import 'package:timirama/services/base_repository.dart';

class MatchRepository extends BaseRepository {
  MatchRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  /// Save right swipe
  Future<void> saveRightSwipe(String swipedUserId) async {
    final likeRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('liked')
        .doc('main');

    final snapshot = await likeRef.get();

    if (!snapshot.exists) {
      await likeRef.set({
        'likedUserIds': [swipedUserId]
      });
    } else {
      await likeRef.update({
        'likedUserIds': FieldValue.arrayUnion([swipedUserId])
      });
    }
  }

  /// Check if that user already swiped right on me
  Future<bool> didTheyLikeMe(String swipedUserId) async {
    final theirLikeRef = firestore
        .collection('users')
        .doc(swipedUserId)
        .collection('liked')
        .doc('main');

    final snapshot = await theirLikeRef.get();
    final data = snapshot.data();

    if (data == null || !data.containsKey('likedUserIds')) return false;

    return (data['likedUserIds'] as List).contains(currentUserId);
  }

  /// Save mutual match to both users
  Future<void> saveMatch(String otherUserId) async {
    final now = DateTime.now();

    final myMatchRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('matches')
        .doc(otherUserId);

    final theirMatchRef = firestore
        .collection('users')
        .doc(otherUserId)
        .collection('matches')
        .doc(currentUserId);

    final myMatch = MatchModel(id: otherUserId, matchedAt: now);
    final theirMatch = MatchModel(id: currentUserId, matchedAt: now);

    await myMatchRef.set(myMatch.toMap());
    await theirMatchRef.set(theirMatch.toMap());
  }

  /// Called when user swipes right — main function
  Future<bool> handleRightSwipe(String swipedUserId) async {
    await saveRightSwipe(swipedUserId); // Save my swipe

    final isMutual = await didTheyLikeMe(swipedUserId);

    if (isMutual) {
      await saveMatch(swipedUserId); // Save match in both accounts
      return true; // Mutual match!
    }

    return false; // No match (yet)
  }
}
