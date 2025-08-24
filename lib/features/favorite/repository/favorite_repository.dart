import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:timirama/features/favorite/model/favorite_model.dart';
import 'package:timirama/services/base_repository.dart';

class FavoriteRepository extends BaseRepository {
  FavoriteRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }
  // Add Favorite
  Future<void> addFavorite(String favId) async {
    final favouriteDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('favourite')
        .doc('main');

    final docSnapshot = await favouriteDocRef.get();
    final FavoriteModel favoriteModel = FavoriteModel(
      id: currentUserId,
      favId: [favId],
    );
    if (!docSnapshot.exists) {
      await favouriteDocRef.set(favoriteModel.toMap());
    } else {
      await favouriteDocRef.update({
        'favId': FieldValue.arrayUnion([favId]),
      });
    }
  }

  // Remove Favorite
  Future<void> removeFavorite(String favId) async {
    final favouriteDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('favourite')
        .doc('main');

    final docSnapshot = await favouriteDocRef.get();
    if (!docSnapshot.exists) return;

    await favouriteDocRef.update({
      'favId': FieldValue.arrayRemove([favId]),
    });

    // Re-check the updated document to see if list is now empty
    final updatedDoc = await favouriteDocRef.get();
    final data = updatedDoc.data();

    if (data != null) {
      final List<dynamic>? favIds = data['favId'];
      if (favIds == null || favIds.isEmpty) {
        await favouriteDocRef.delete();
      }
    }
  }

  // Fetch Favorites
  Future<FavoriteModel?> fetchFavorites() async {
    debugPrint("currentUserId : $currentUserId");

    final favouriteDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('favourite')
        .doc('main');

    final docSnapshot = await favouriteDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return FavoriteModel.fromJson(docSnapshot.data()!);
  }
}
