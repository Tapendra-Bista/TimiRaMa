import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:timirama/features/follow/model/follow_model.dart';
import 'package:timirama/services/base_repository.dart';

class FollowRepository extends BaseRepository {
  FollowRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }
  //-------------------------- Add Follow --------------------------
  Future<void> addFollow(String followId) async {
    final followDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('follow')
        .doc('main');

    final docSnapshot = await followDocRef.get();
    final FollowModel followModel = FollowModel(
      id: currentUserId,
      followId: [followId],
    );
    if (!docSnapshot.exists) {
      await followDocRef.set(followModel.toMap());
    } else {
      await followDocRef.update({
        'followId': FieldValue.arrayUnion([followId]),
      });
    }
  }

  //-------------------------- Remove Follow --------------------------
  Future<void> removeFollow(String followId) async {
    final followDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('follow')
        .doc('main');

    final docSnapshot = await followDocRef.get();
    if (!docSnapshot.exists) return;

    await followDocRef.update({
      'followId': FieldValue.arrayRemove([followId]),
    });

    final updatedDoc = await followDocRef.get();
    final data = updatedDoc.data();

    if (data != null) {
      final List<dynamic>? followIds = data['followId'];
      if (followIds == null || followIds.isEmpty) {
        await followDocRef.delete();
      }
    }
  }

  //-------------------------- Fetch Follows --------------------------
  Future<FollowModel?> fetchFollows() async {
    debugPrint("currentUserId : $currentUserId");

    final followDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('follow')
        .doc('main');

    final docSnapshot = await followDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return FollowModel.fromJson(docSnapshot.data()!);
  }
}
