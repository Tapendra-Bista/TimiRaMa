import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:timirama/features/like/model/like_model.dart';
import 'package:timirama/services/base_repository.dart';

class LikeRepository extends BaseRepository {
  LikeRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  //--------------------------adding like--------------------------
  Future<void> addLike(String likeId) async {
    final userDocId = currentUserId;

    final likeDocRef = firestore
        .collection('users')
        .doc(userDocId)
        .collection('like')
        .doc('main');

    final docSnapshot = await likeDocRef.get();

    if (!docSnapshot.exists) {
      await likeDocRef.set({
        'id': userDocId,
        'likeId': [likeId],
      });
    } else {
      await likeDocRef.update({
        'likeId': FieldValue.arrayUnion([likeId]),
      });
    }
  }

  //-----------------removing like--------------------------
  Future<void> removeLike(String likeId) async {
    final userDocId = currentUserId;

    final likeDocRef = firestore
        .collection('users')
        .doc(userDocId)
        .collection('like')
        .doc('main');

    final docSnapshot = await likeDocRef.get();

    if (!docSnapshot.exists) return;

    await likeDocRef.update({
      'likeId': FieldValue.arrayRemove([likeId]),
    });

    final updatedDoc = await likeDocRef.get();
    final data = updatedDoc.data();

    if (data != null) {
      final List<dynamic>? likeIds = data['likeId'];
      if (likeIds == null || likeIds.isEmpty) {
        await likeDocRef.delete();
      }
    }
  }

  //-----------------fetching likes--------------------------
  Future<LikeModel?> fetchLikes() async {
    debugPrint("currentUserId : $currentUserId");

    final userDocId = currentUserId;

    final likeDocRef = firestore
        .collection('users')
        .doc(userDocId)
        .collection('like')
        .doc('main');

    final docSnapshot = await likeDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return LikeModel.fromJson(docSnapshot.data()!);
  }
}
