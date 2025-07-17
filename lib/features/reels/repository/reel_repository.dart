import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timirama/features/reels/model/comment_model.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/services/base_repository.dart';

class ReelRepository extends BaseRepository {
  ReelRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }
  //---------get/fetch reels--------------
  Future<List<ReelModel>> getReels() async {
    try {
      final QuerySnapshot reels = await firestore.collection('reels').get();
      if (reels.docs.isEmpty) return [];

      return reels.docs.map((item) {
        final data = item.data() as Map<String, dynamic>;
        return ReelModel.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  //------------- set comment------------
  Future<void> setComment(CommentModel commentModel) async {
    await firestore.collection('reels').doc(currentUserId).update({
      'comment': FieldValue.arrayUnion([commentModel]),
    });
  }
}
