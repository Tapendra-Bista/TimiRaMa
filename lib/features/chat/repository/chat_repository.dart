import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:timirama/services/base_repository.dart';

class ChatRepository extends BaseRepository {
  ChatRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }
  CollectionReference get _chatRooms => firestore.collection("chatRooms");

  CollectionReference getChatRoomMessages(String chatRoomId) {
    return _chatRooms.doc(chatRoomId).collection("messages");
  }

  //- voice save in Cloudinary-
  Future<String> voiceMessage({required String voiceMessageUrl}) async {
    try {
      final CloudinaryPublic cloudinary = CloudinaryPublic(
        AppStrings.cloudName,
        AppStrings.uploadPreset,
      );

      final CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          voiceMessageUrl,
          resourceType: CloudinaryResourceType.Video,
          folder: "timirama/voice",
          publicId: "${DateTime.now().millisecond}",
        ),
      );
      print(" Uploaded successfully: ${response.secureUrl}");
      return response.secureUrl;
    } catch (e) {
      print("Error in voiceMessage Cloudiary : ${e.toString()}");
      rethrow;
    }
  }
  // delete message

  Future<void> deleteMessageByContentAndTimestamp({
    required String chatRoomId,
    required String content,
    required Timestamp timestamp,
  }) async {
    final batch = firestore.batch();
    final messagesRef = await getChatRoomMessages(chatRoomId);

    final querySnapshot = await messagesRef
        .where('content', isEqualTo: content)
        .where('timestamp', isEqualTo: timestamp)
        .get();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }
    batch.commit();
  }

  // delete ChatRoom
  Future<void> deleteChatRoom(String currentUserId, String otherUserId) async {
    try {
      final users = [currentUserId, otherUserId]..sort();
      final roomId = users.join("_");
      final bacth = firestore.batch();
      // 1. Reference to messages subcollection
      final messagesRef = _chatRooms
          .doc(roomId)
          .collection("messages")
          .where('senderId', isEqualTo: currentUserId);

      // 2. Fetch all documents in messages subcollection
      final messagesSnapshot = await messagesRef.get();

      // 3. Delete each message document
      for (final doc in messagesSnapshot.docs) {
        bacth.delete(doc.reference);
      }
      bacth.delete(_chatRooms.doc(roomId));
      bacth.commit();
      print("Chat room $roomId and all its messages deleted successfully.");
    } catch (e) {
      print("Failed to delete chat room: $e");
      rethrow;
    }
  }

  Future<ChatRoomModel> getOrCreateChatRoom(
    String currentUserId,
    String otherUserId,
  ) async {
    // Prevent creating a chat room with yourself
    if (currentUserId == otherUserId) {
      throw Exception("Cannot create a chat room with yourself");
    }

    final users = [currentUserId, otherUserId]..sort();
    final roomId = users.join("_");

    final roomDoc = await _chatRooms.doc(roomId).get();

    if (roomDoc.exists) {
      return ChatRoomModel.fromFirestore(roomDoc);
    }
    final currentUserSnapshot =
        await firestore.collection('users').doc(currentUserId).get();

    final otherUserSnapshot =
        await firestore.collection('users').doc(otherUserId).get();

    // Assuming there is always one document returned for each user
    final currentUserData = currentUserSnapshot.data()!;
    final otherUserData = otherUserSnapshot.data()!;

    final participantsName = {
      currentUserId: {
        'pseudo': currentUserData['pseudo']?.toString() ?? '',
        'imgURL': currentUserData['imgURL']?.toString() ?? '',
      },
      otherUserId: {
        'pseudo': otherUserData['pseudo']?.toString() ?? '',
        'imgURL': otherUserData['imgURL']?.toString() ?? '',
      },
    };

    final newRoom = ChatRoomModel(
      id: roomId,
      participants: users,
      participantsName: participantsName,
      lastReadTime: {
        currentUserId: Timestamp.now(),
        otherUserId: Timestamp.now(),
      },
    );

    await _chatRooms.doc(roomId).set(newRoom.toMap());
    return newRoom;
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String receiverId,
    required String content,
    MessageType type = MessageType.text,
  }) async {
    //batch
    final batch = firestore.batch();

    //get message sub collection

    final messageRef = getChatRoomMessages(chatRoomId);
    final messageDoc = messageRef.doc();

    //chatmessage

    final message = ChatMessage(
      id: messageDoc.id,
      chatRoomId: chatRoomId,
      senderId: senderId,
      receiverId: receiverId,
      content: content,
      type: type,
      timestamp: Timestamp.now(),
      readBy: [senderId],
    );

    //add message to sub collection
    batch.set(messageDoc, message.toMap());

    //update chatroom

    batch.update(_chatRooms.doc(chatRoomId), {
      "lastMessage": content,
      "lastMessageSenderId": senderId,
      "lastMessageTime": message.timestamp,
    });
    await batch.commit();
  }

  //a> b      // get mesages
  Stream<List<ChatMessage>> getMessages(
    String chatRoomId, {
    DocumentSnapshot? lastDocument,
  }) {
    var query = getChatRoomMessages(
      chatRoomId,
    ).orderBy('timestamp', descending: true).limit(20);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }
    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatMessage.fromFirestore(doc))
              .toList(),
        );
  }

  //-get more Messages
  Future<List<ChatMessage>> getMoreMessages(
    String chatRoomId, {
    required DocumentSnapshot lastDocument,
  }) async {
    final query = getChatRoomMessages(chatRoomId)
        .orderBy('timestamp', descending: true)
        .startAfterDocument(lastDocument)
        .limit(20);
    print("comingg");
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => ChatMessage.fromFirestore(doc)).toList();
  }

  //-getChats Rooms
  Stream<List<ChatRoomModel>> getChatRooms(String userId) {
    return _chatRooms
        .where("participants", arrayContains: userId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatRoomModel.fromFirestore(doc))
              .toList(),
        );
  }

  // no. of unread Count or messages-
  Stream<int> getUnreadCount(String chatRoomId, String userId) {
    return getChatRoomMessages(chatRoomId)
        .where("receiverId", isEqualTo: userId)
        .where('status', isEqualTo: MessageStatus.sent.name)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  //Mark as read
  Future<void> markMessagesAsRead(String chatRoomId, String userId) async {
    try {
      final batch = firestore.batch();

      //get all unread messages where user is receviver

      final unreadMessages = await getChatRoomMessages(chatRoomId)
          .where("receiverId", isEqualTo: userId)
          .where('status', isEqualTo: MessageStatus.sent.name)
          .get();
      print("found ${unreadMessages.docs.length} unread messages");

      for (final doc in unreadMessages.docs) {
        batch.update(doc.reference, {
          'readBy': FieldValue.arrayUnion([userId]),
          'status': MessageStatus.read.name,
        });

        await batch.commit();

        print("Marked messaegs as read for user $userId");
      }
    } catch (e) {}
  }

  // Update Typing Status
  Future<void> updateTypingStatus(
    String chatRoomId,
    String userId,
    bool isTyping,
  ) async {
    try {
      final doc = await _chatRooms.doc(chatRoomId).get();
      if (!doc.exists) {
        print("chat room does not exist");
        return;
      }
      await _chatRooms.doc(chatRoomId).update({
        'isTyping': isTyping,
        'typingUserId': isTyping ? userId : null,
      });
    } catch (e) {
      print("error updating typing status");
    }
  }

  //Get typing Status 
  Stream<Map<String, dynamic>> getTypingStatus(String chatRoomId) {
    return _chatRooms.doc(chatRoomId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return {'isTyping': false, 'typingUserId': null};
      }
      final data = snapshot.data() as Map<String, dynamic>;
      return {
        "isTyping": data['isTyping'] ?? false,
        "typingUserId": data['typingUserId'],
      };
    });
  }
}
