import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatEvent {}

class InitializeChatEvent extends ChatEvent {
  final String receiverId;

  InitializeChatEvent(this.receiverId);
}

class SendMessage extends ChatEvent {
  final String receiverId;
  final String content;

  SendMessage({required this.receiverId, required this.content});
}

class SendVoiceMessage extends ChatEvent {
  final String receiverId;
  final String rawUrl;

  SendVoiceMessage({required this.receiverId, required this.rawUrl});
}

class LoadMoreMessages extends ChatEvent {}

class StartTyping extends ChatEvent {}

class LeaveChat extends ChatEvent {}

class MessagesUpdated extends ChatEvent {
  final List<ChatMessage> messages;

  MessagesUpdated(this.messages);
}

class OnlineStatusUpdated extends ChatEvent {
  final bool isOnline;
  final Timestamp? lastSeen;

  OnlineStatusUpdated(this.isOnline, this.lastSeen);
}

class TypingStatusUpdated extends ChatEvent {
  final bool isTyping;

  TypingStatusUpdated(this.isTyping);
}

class ChatRoomsLists extends ChatEvent {
  final String id;

  ChatRoomsLists({required this.id});
}

class ChatRoomsUpdated extends ChatEvent {
  final List<ChatRoomModel> chatRooms;

  ChatRoomsUpdated({required this.chatRooms});
}

class ChatRoomsError extends ChatEvent {
  final String errorMessage;

  ChatRoomsError({required this.errorMessage});
}

class DeleteChatRoom extends ChatEvent {
  final String currentUserId;

  final String otherUserId;

  DeleteChatRoom({required this.currentUserId, required this.otherUserId});
}

class DeleteMessage extends ChatEvent {
  final String chatRoomId;
  final String content;
  final Timestamp timestamp;

  DeleteMessage({
    required this.chatRoomId,
    required this.content,
    required this.timestamp,
  });
}
