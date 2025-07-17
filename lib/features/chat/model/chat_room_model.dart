// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModel {
  final String id;
  final List<String> participants;
  final String? lastMessage;
  final String? lastMessageSenderId;
  final Timestamp? lastMessageTime;
  final Map<String, Timestamp>? lastReadTime;
  final Map<String, Map<String, String>>? participantsName;
  final bool isTyping;
  final String? typingUserId;
  final bool isCallActive;
//-----------------------------Chat Room Model----------------------------------------------
  ChatRoomModel({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.lastMessageSenderId,
    this.lastMessageTime,
    Map<String, Timestamp>? lastReadTime,
    Map<String, Map<String, String>>? participantsName,
    this.isTyping = false,
    this.typingUserId,
    this.isCallActive = false,
  })  : lastReadTime = lastReadTime ?? {},
        participantsName = participantsName ?? {};

  factory ChatRoomModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final rawParticipantsName =
        data['participantsName'] as Map<String, dynamic>?;

    final participantsName = rawParticipantsName?.map(
      (key, value) {
        final valueMap = Map<String, String>.from(value as Map);
        return MapEntry(key, valueMap);
      },
    );

    return ChatRoomModel(
      id: doc.id,
      participants: List<String>.from(data['participants']),
      lastMessage: data['lastMessage'],
      lastMessageSenderId: data['lastMessageSenderId'],
      lastMessageTime: data['lastMessageTime'],
      lastReadTime: Map<String, Timestamp>.from(data['lastReadTime'] ?? {}),
      participantsName: participantsName,
      isTyping: data['isTyping'] ?? false,
      typingUserId: data['typingUserId'],
      isCallActive: data['isCallActive'] ?? false,
    );
  }

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    final rawParticipantsName =
        json['participantsName'] as Map<String, dynamic>?;

    final participantsName = rawParticipantsName?.map(
      (key, value) {
        final valueMap = Map<String, String>.from(value as Map);
        return MapEntry(key, valueMap);
      },
    );

    return ChatRoomModel(
      id: json['id'],
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      lastMessageSenderId: json['lastMessageSenderId'],
      lastMessageTime: json['lastMessageTime'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(json['lastMessageTime'])
          : null,
      lastReadTime: json['lastReadTime'] != null
          ? (json['lastReadTime'] as Map<String, dynamic>).map(
              (key, value) =>
                  MapEntry(key, Timestamp.fromMillisecondsSinceEpoch(value)),
            )
          : {},
      participantsName: participantsName,
      isTyping: json['isTyping'] ?? false,
      typingUserId: json['typingUserId'],
      isCallActive: json['isCallActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageSenderId': lastMessageSenderId,
      'lastMessageTime': lastMessageTime?.millisecondsSinceEpoch,
      'lastReadTime': lastReadTime?.map(
        (key, value) => MapEntry(key, value.millisecondsSinceEpoch),
      ),
      'participantsName': participantsName,
      'isTyping': isTyping,
      'typingUserId': typingUserId,
      'isCallActive': isCallActive,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageSenderId': lastMessageSenderId,
      'lastMessageTime': lastMessageTime,
      'lastReadTime': lastReadTime,
      'participantsName': participantsName,
      'isTyping': isTyping,
      'typingUserId': typingUserId,
      'isCallActive': isCallActive,
    };
  }
}
