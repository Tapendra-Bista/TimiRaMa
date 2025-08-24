import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';
import 'package:timirama/services/base_repository.dart';

class RequestRepository extends BaseRepository {
  RequestRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }
  // send Requests
  Future<void> sendRequests(Requestmodel obj) async {
    try {
      // Prevent creating a chat room with yourself
      final users = [obj.senderId, obj.receiverId]..sort();
      final docId = users.join("_");
      final requestsDocRef = firestore.collection('requests').doc(docId);

      final docSnapshot = await requestsDocRef.get();

      if (!docSnapshot.exists) {
        await requestsDocRef.set(obj.toMap());
      } else {
        print("Already sent requests");
      }
    } catch (e) {
      rethrow;
    }
  }

  //CheckWhether user available or not-
  Future<Requestmodel?> isUserAvailable({
    required String senderId,
    required String receiverId,
  }) async {
    try {
      final users = [senderId, receiverId]..sort();
      final docId = users.join("_");
      final requestsDocRef = firestore.collection('requests').doc(docId);

      final docSnapshot = await requestsDocRef.get();

      if (!docSnapshot.exists) return null;
      return Requestmodel.fromJson(docSnapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  //-accept request
  Future<void> acceptRequest({
    required String senderId,
    required String receiverId,
  }) async {
    final users = [senderId, receiverId]..sort();
    final docId = users.join("_");
    final requestsDocRef = firestore.collection('requests').doc(docId);
    final docSnapshot = await requestsDocRef.get();

    if (!docSnapshot.exists) return null;
    requestsDocRef.update({'responseStatus': ResponseStatus.Accepted.name});
  }

  // delete Requests
  Future<void> deleteRequests({
    required String senderId,
    required String receiverId,
  }) async {
    // Prevent creating a chat room with yourself
    final users = [senderId, receiverId]..sort();
    final docId = users.join("_");
    final requestsDocRef = firestore.collection('requests').doc(docId);

    final docSnapshot = await requestsDocRef.get();

    if (!docSnapshot.exists) return;

    requestsDocRef.delete();
    print("Requests deleted ");
  }

  // Fetch Requestss
  Future<List<Requestmodel>> fetchRequests() async {
    try {
      final requestsCollRef = firestore.collection('requests');

      final querySnapshot = await requestsCollRef
          .where('receiverId', isEqualTo: currentUserId)
          .get(); //  QUERY at the database level

      if (querySnapshot.docs.isEmpty) return [];

      return querySnapshot.docs
          .map((item) => Requestmodel.fromJson(item.data()))
          .toList(); //  Clean, efficient
    } catch (e) {
      rethrow;
    }
  }

  //  // sends Requests List
  Future<List<Requestmodel>> sendRequestsList() async {
    try {
      final requestsCollRef = firestore.collection('requests');

      final querySnapshot = await requestsCollRef
          .where('senderId', isEqualTo: currentUserId)
          .get(); //  QUERY at the database level

      if (querySnapshot.docs.isEmpty) return [];

      return querySnapshot.docs
          .map((item) => Requestmodel.fromJson(item.data()))
          .toList(); //  Clean, efficient
    } catch (e) {
      rethrow;
    }
  }

  //Count total request
  Future<int> unReadRequests() async {
    try {
      final requestsCollRef = firestore.collection('requests');

      final querySnapshot = await requestsCollRef
          .where('receiverId', isEqualTo: currentUserId)
          .where('requestStatus', isEqualTo: RequestStatus.Send.name)
          .get();

      if (querySnapshot.docs.isEmpty) return 0;
      return querySnapshot.docs.length;
    } catch (e) {
      rethrow;
    }
  }

  //make as read
  Future<void> markAsRead() async {
    final batch = firestore.batch();
    try {
      final requestsCollRef = firestore.collection('requests');
      final querySnapshot = await requestsCollRef
          .where('receiverId', isEqualTo: currentUserId)
          .where('requestStatus', isEqualTo: RequestStatus.Send.name)
          .get();

      if (querySnapshot.docs.isEmpty) return;
      for (final doc in querySnapshot.docs) {
        batch.update(doc.reference, {'requestStatus': RequestStatus.Read.name});
      }
      await batch.commit();
      print("Requests are marked as Reaed");
    } catch (e) {
      rethrow;
    }
  }
}
