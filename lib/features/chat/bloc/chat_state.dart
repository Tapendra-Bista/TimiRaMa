import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


enum ChatStatus { initial, loading, loaded, error }

class ChatState {
  final List<ChatRoomModel> chatRoomModel;
  final List<ChatMessage>
  messages; // Assuming you have MessageModel for chat messages
  final ChatStatus status;
  final String? chatRoomId;
  final String? receiverId;
  final bool isReceiverOnline;
  final Timestamp? receiverLastSeen;
  final bool isReceiverTyping;
  final bool hasMoreMessages;
  final bool isLoadingMore;
  final String? error;
  final bool? isDelete;
  const ChatState({
    this.isDelete = false,
    this.chatRoomModel = const [],
    this.messages = const [],
    this.status = ChatStatus.initial,
    this.chatRoomId,
    this.receiverId,
    this.isReceiverOnline = false,
    this.receiverLastSeen,
    this.isReceiverTyping = false,
    this.hasMoreMessages = true,
    this.isLoadingMore = false,
    this.error,
  });

  ChatState copyWith({
    List<ChatRoomModel>? chatRoomModel,
    List<ChatMessage>? messages,
    ChatStatus? status,
    String? chatRoomId,
    String? receiverId,
    bool? isReceiverOnline,
    Timestamp? receiverLastSeen,
    bool? isReceiverTyping,
    bool? hasMoreMessages,
    bool? isLoadingMore,
    String? error,
    bool? isDelete,
  }) {
    return ChatState(
      chatRoomModel: chatRoomModel ?? this.chatRoomModel,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      receiverId: receiverId ?? this.receiverId,
      isReceiverOnline: isReceiverOnline ?? this.isReceiverOnline,
      receiverLastSeen: receiverLastSeen ?? this.receiverLastSeen,
      isReceiverTyping: isReceiverTyping ?? this.isReceiverTyping,
      hasMoreMessages: hasMoreMessages ?? this.hasMoreMessages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error ?? this.error,
      isDelete: isDelete ?? this.isDelete,
    );
  }
}

class ChatLoading extends ChatState {}

class ChatEmpty extends ChatState {}
