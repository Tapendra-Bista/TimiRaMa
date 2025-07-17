import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:timirama/features/archive/model/archive_model.dart';
import 'package:timirama/services/base_repository.dart';

class ArchiveRepository extends BaseRepository {
  ArchiveRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  //-------------------------- Add Archive --------------------------
  Future<void> addArchive(String archiveId) async {
    final archiveDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('archive')
        .doc('main');

    final docSnapshot = await archiveDocRef.get();
    ArchiveModel archiveModel = ArchiveModel(
      id: currentUserId,
      archiveId: [archiveId],
    );
    if (!docSnapshot.exists) {
      await archiveDocRef.set(archiveModel.toMap());
    } else {
      await archiveDocRef.update({
        'archiveId': FieldValue.arrayUnion([archiveId]),
      });
    }
  }

  //-------------------------- Remove Archive --------------------------
  Future<void> removeArchive(String archiveId) async {
    final archiveDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('archive')
        .doc('main');

    final docSnapshot = await archiveDocRef.get();

    if (!docSnapshot.exists) return;

    await archiveDocRef.update({
      'archiveId': FieldValue.arrayRemove([archiveId]),
    });

    // Clean up if list is now empty
    final updatedDoc = await archiveDocRef.get();
    final data = updatedDoc.data();

    if (data != null) {
      final List<dynamic>? archiveIds = data['archiveId'];
      if (archiveIds == null || archiveIds.isEmpty) {
        await archiveDocRef.delete();
      }
    }
  }

  //-------------------------- Fetch Archives --------------------------
  Future<ArchiveModel?> fetchArchives() async {
    debugPrint("currentUserId : $currentUserId");

    final archiveDocRef = firestore
        .collection('users')
        .doc(currentUserId)
        .collection('archive')
        .doc('main');

    final docSnapshot = await archiveDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return ArchiveModel.fromJson(docSnapshot.data()!);
  }
}
