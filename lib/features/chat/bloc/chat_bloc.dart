import 'dart:async';
import 'dart:developer';
import 'package:timirama/features/block/repository/block_repository.dart';
import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  bool _isInChat = false;

  StreamSubscription? _messageSubscription;
  StreamSubscription? _onlineStatusSubscription;
  StreamSubscription? _typingSubscription;
  StreamSubscription<List<ChatRoomModel>>? _chatRoomsSubscription;
  Timer? _typingTimer;

  ChatBloc({required ChatRepository chatRepository})
    : _chatRepository = chatRepository,
      super(const ChatState()) {
    on<InitializeChatEvent>(_onEnterChat);
    on<SendMessage>(_onSendMessage);
    on<SendVoiceMessage>(_onSendVoiceMessage);
    on<LoadMoreMessages>(_onLoadMoreMessages);
    on<StartTyping>(_onStartTyping);
    on<LeaveChat>(_onLeaveChat);
    on<MessagesUpdated>(_onMessagesUpdated);
    on<OnlineStatusUpdated>(_onOnlineStatusUpdated);
    on<TypingStatusUpdated>(_onTypingStatusUpdated);
    on<ChatRoomsLists>(_onChatRoomsLists);
    on<ChatRoomsUpdated>(_onChatRoomsUpdated);
    on<ChatRoomsError>(_onChatRoomsError);
    on<DeleteChatRoom>(_onDeleteChatRoom);
    on<DeleteMessage>(_onDeleteMessage);
  }

  void _onChatRoomsUpdated(ChatRoomsUpdated event, Emitter<ChatState> emit) {
    if (event.chatRooms.isEmpty) {
      emit(ChatEmpty());
    } else {
      emit(
        state.copyWith(
          chatRoomModel: event.chatRooms,
          error: null,
          isDelete: false,
        ),
      );
    }
  }

  void _onChatRoomsError(ChatRoomsError event, Emitter<ChatState> emit) {
    emit(state.copyWith(error: event.errorMessage));
  }

  Future<void> _onChatRoomsLists(
    ChatRoomsLists event,
    Emitter<ChatState> emit,
  ) async {
    _chatRoomsSubscription?.cancel();

    emit(ChatLoading());
    _chatRoomsSubscription = _chatRepository.getChatRooms(event.id).listen((
      chatsData,
    ) async {
      try {
        final blockData = await getIt<BlockRepository>().fetchBlocks();
        final blockedUserIds = blockData?.blockId ?? [];

        final List<ChatRoomModel> chats = chatsData.where((chat) {
          final otherUserId = chat.participants.firstWhere(
            (id) => id != FirebaseAuth.instance.currentUser!.uid,
            orElse: () => '',
          );
          return otherUserId.isNotEmpty &&
              !blockedUserIds.contains(otherUserId);
        }).toList();

        add(ChatRoomsUpdated(chatRooms: chats));
      } catch (e) {
        add(ChatRoomsError(errorMessage: e.toString()));
      }
    });
  }

  Future<void> _onEnterChat(
    InitializeChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    _isInChat = true;
    emit(state.copyWith(messages: state.messages));
    try {
      final chatRoom = await _chatRepository.getOrCreateChatRoom(
        FirebaseAuth.instance.currentUser!.uid,
        event.receiverId,
      );

      emit(
        state.copyWith(
          chatRoomId: chatRoom.id,
          receiverId: event.receiverId,
          status: ChatStatus.loaded,
        ),
      );

      _subscribeToMessages(chatRoom.id);

      _subscribeToTypingStatus(chatRoom.id);
    } catch (e) {
      emit(
        state.copyWith(
          status: ChatStatus.error,
          error: "Failed to create chat room: $e",
        ),
      );
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    if (state.chatRoomId == null) return;
    try {
      await _chatRepository.sendMessage(
        chatRoomId: state.chatRoomId!,
        senderId: FirebaseAuth.instance.currentUser!.uid,
        receiverId: event.receiverId,
        content: event.content,
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(error: "Failed to send message"));
    }
  }

  Future<void> _onSendVoiceMessage(
    SendVoiceMessage event,
    Emitter<ChatState> emit,
  ) async {
    if (state.chatRoomId == null) return;
    try {
      final voiceMessageUrl = await _chatRepository.voiceMessage(
        voiceMessageUrl: event.rawUrl,
      );
      await _chatRepository.sendMessage(
        chatRoomId: state.chatRoomId!,
        senderId: FirebaseAuth.instance.currentUser!.uid,
        receiverId: event.receiverId,
        content: voiceMessageUrl,
        type: MessageType.voice,
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(error: "Failed to send message"));
    }
  }

  Future<void> _onLoadMoreMessages(
    LoadMoreMessages event,
    Emitter<ChatState> emit,
  ) async {
    if (state.status != ChatStatus.loaded ||
        state.messages.isEmpty ||
        !state.hasMoreMessages ||
        state.isLoadingMore)
      return;

    emit(state.copyWith(isLoadingMore: true));
    try {
      final lastMessage = state.messages.last;
      final lastDoc = await _chatRepository
          .getChatRoomMessages(state.chatRoomId!)
          .doc(lastMessage.id)
          .get();

      final moreMessages = await _chatRepository.getMoreMessages(
        state.chatRoomId!,
        lastDocument: lastDoc,
      );

      if (moreMessages.isEmpty) {
        emit(state.copyWith(hasMoreMessages: false, isLoadingMore: false));
        return;
      }

      emit(
        state.copyWith(
          messages: [...state.messages, ...moreMessages],
          hasMoreMessages: moreMessages.length >= 20,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: "Failed to load more messages",
          isLoadingMore: false,
        ),
      );
    }
  }

  void _subscribeToMessages(String chatRoomId) {
    _messageSubscription?.cancel();
    _messageSubscription = _chatRepository
        .getMessages(chatRoomId)
        .listen(
          (messages) {
            if (_isInChat) _markMessagesAsRead(chatRoomId);
            add(MessagesUpdated(messages));
          },
          onError: (error) {
            add(ChatRoomsError(errorMessage: "Failed to load messages"));
          },
        );
  }

  void _subscribeToTypingStatus(String chatRoomId) {
    _typingSubscription?.cancel();
    _typingSubscription = _chatRepository.getTypingStatus(chatRoomId).listen((
      status,
    ) {
      final isTyping = status["isTyping"] as bool;
      final typingUserId = status["typingUserId"] as String?;
      final isOtherUser =
          typingUserId != FirebaseAuth.instance.currentUser!.uid;
      add(TypingStatusUpdated(isTyping && isOtherUser));
    });
  }

  Future<void> _onStartTyping(
    StartTyping event,
    Emitter<ChatState> emit,
  ) async {
    if (state.chatRoomId == null) return;
    _typingTimer?.cancel();
    _updateTypingStatus(true);
    _typingTimer = Timer(const Duration(seconds: 3), () {
      _updateTypingStatus(false);
    });
  }

  Future<void> _updateTypingStatus(bool isTyping) async {
    if (state.chatRoomId == null) return;
    try {
      await _chatRepository.updateTypingStatus(
        state.chatRoomId!,
        FirebaseAuth.instance.currentUser!.uid,
        isTyping,
      );
    } catch (e) {
      print("error updating typing status $e");
    }
  }

  Future<void> _markMessagesAsRead(String chatRoomId) async {
    try {
      await _chatRepository.markMessagesAsRead(
        chatRoomId,
        FirebaseAuth.instance.currentUser!.uid,
      );
    } catch (e) {
      print("error marking messages as read $e");
    }
  }

  Future<void> _onLeaveChat(LeaveChat event, Emitter<ChatState> emit) async {
    _isInChat = false;
    emit(state.copyWith(messages: [], error: null));
  }

  void _onMessagesUpdated(MessagesUpdated event, Emitter<ChatState> emit) {
    emit(state.copyWith(messages: event.messages, error: null));
  }

  void _onOnlineStatusUpdated(
    OnlineStatusUpdated event,
    Emitter<ChatState> emit,
  ) {
    emit(
      state.copyWith(
        isReceiverOnline: event.isOnline,
        receiverLastSeen: event.lastSeen,
      ),
    );
  }

  void _onTypingStatusUpdated(
    TypingStatusUpdated event,
    Emitter<ChatState> emit,
  ) {
    emit(state.copyWith(isReceiverTyping: event.isTyping));
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _onlineStatusSubscription?.cancel();
    _typingSubscription?.cancel();
    _chatRoomsSubscription?.cancel();
    _typingTimer?.cancel();
    return super.close();
  }

  FutureOr<void> _onDeleteChatRoom(
    DeleteChatRoom event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isDelete: true));
    await _chatRepository.deleteChatRoom(
      event.currentUserId,
      event.otherUserId,
    );

    add(ChatRoomsLists(id: event.currentUserId));
  }

  FutureOr<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<ChatState> emit,
  ) async {
    await _chatRepository.deleteMessageByContentAndTimestamp(
      chatRoomId: event.chatRoomId,
      content: event.content,
      timestamp: event.timestamp,
    );
  }
}
