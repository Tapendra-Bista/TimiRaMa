import 'package:timirama/features/block/model/block_model.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

import 'package:timirama/services/base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class BlockRepository extends BaseRepository {
  late final FirebaseFirestore firestore;

  BlockRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  //-------------------------- Add Block --------------------------
  Future<void> addBlock(String blockId) async {
    final blockDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('block')
        .doc('main');

    final docSnapshot = await blockDocRef.get();
    final BlockModel blockModel = BlockModel(
      id: currentUserId,
      blockId: [blockId],
    );

    if (!docSnapshot.exists) {
      await blockDocRef.set(blockModel.toMap());
    } else {
      await blockDocRef.update({
        'blockId': FieldValue.arrayUnion([blockId]),
      });
    }
  }

  //-------------------------- Remove Block --------------------------
  Future<void> removeBlock(String blockId) async {
    final blockDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('block')
        .doc('main');

    final docSnapshot = await blockDocRef.get();
    if (!docSnapshot.exists) return;

    await blockDocRef.update({
      'blockId': FieldValue.arrayRemove([blockId]),
    });

    final updatedDoc = await blockDocRef.get();
    final data = updatedDoc.data();

    if (data != null) {
      final List<dynamic>? blockIds = data['blockId'];
      if (blockIds == null || blockIds.isEmpty) {
        await blockDocRef.delete();
      }
    }
  }

  //-------------------------- Fetch My Block List --------------------------
  Future<BlockModel?> fetchBlocks() async {
    debugPrint("currentUserId : $currentUserId");

    final blockDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('block')
        .doc('main');

    final docSnapshot = await blockDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return BlockModel.fromJson(docSnapshot.data()!);
  }

  //-------------------------- Check if I’m Blocked by Other User --------------------------
  Future<bool> hasUserBlockedMe(String otherUserId) async {
    final doc = await firestore
        .collection('users')
        .doc(otherUserId)
        .collection('block')
        .doc('main')
        .get();

    if (!doc.exists) return false;
    final List<dynamic> blockedList = doc.data()?['blockId'] ?? [];
    return blockedList.contains(currentUserId);
  }

  //-------------------------- Fetch All Other Users' Block Lists (Chunked) --------------------------
  Future<Map<String, List<String>>> fetchOtherUsersBlockListsInChunks(
    List<ProfileModel> users,
  ) async {
    final Map<String, List<String>> userBlockedMap = {};

    // Split users into chunks of 50
    List<List<ProfileModel>> chunkList(List<ProfileModel> list, int size) {
      List<List<ProfileModel>> chunks = [];
      for (int i = 0; i < list.length; i += size) {
        chunks.add(
          list.sublist(i, i + size > list.length ? list.length : i + size),
        );
      }
      return chunks;
    }

    final chunks = chunkList(users, 50);

    for (final chunk in chunks) {
      final futures = chunk.map((user) {
        return firestore
            .collection('users')
            .doc(user.id)
            .collection('block')
            .doc('main')
            .get();
      }).toList();

      final docs = await Future.wait(futures);

      for (int i = 0; i < docs.length; i++) {
        final doc = docs[i];
        final userId = chunk[i].id;

        if (doc.exists) {
          final List<String> blockedIds = List<String>.from(
            doc.data()?['blockId'] ?? [],
          );
          userBlockedMap[userId] = blockedIds;
        } else {
          userBlockedMap[userId] = [];
        }
      }
    }

    return userBlockedMap;
  }

  Future<Map<String, List<String>>> fetchOtherUsersBlockListsInChunksFromIds(
    List<String> userIds,
  ) async {
    final Map<String, List<String>> userBlockedMap = {};

    // Split into chunks of 50 to avoid Firestore overload
    List<List<String>> chunkList(List<String> list, int size) {
      List<List<String>> chunks = [];
      for (int i = 0; i < list.length; i += size) {
        chunks.add(
          list.sublist(i, i + size > list.length ? list.length : i + size),
        );
      }
      return chunks;
    }

    final chunks = chunkList(userIds, 50);

    for (final chunk in chunks) {
      final futures = chunk.map((userId) {
        return firestore
            .collection('users')
            .doc(userId)
            .collection('block')
            .doc('main')
            .get();
      }).toList();

      final docs = await Future.wait(futures);

      for (int i = 0; i < docs.length; i++) {
        final doc = docs[i];
        final userId = chunk[i];

        if (doc.exists) {
          final List<String> blockedIds = List<String>.from(
            doc.data()?['blockId'] ?? [],
          );
          userBlockedMap[userId] = blockedIds;
        } else {
          userBlockedMap[userId] = [];
        }
      }
    }

    return userBlockedMap;
  }
}
