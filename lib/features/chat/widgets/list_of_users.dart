import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_state.dart';
import 'package:timirama/features/chat/model/chat_room_model.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/chat/widgets/chat_list_title.dart';

// Optimized with const constructor and better performance
class ListOfUsers extends StatelessWidget {
  const ListOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    
    return BlocSelector<ChatBloc, ChatState, List<ChatRoomModel>>(
      selector: (state) => state.chatRoomModel,
      builder: (context, chats) {
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            final otherUserId = chat.participants.firstWhere(
              (id) => id != currentUserId,
            );

            return RepaintBoundary(
              child: ChatListTile(
                otherUserId: otherUserId,
                chat: chat,
                currentUserId: currentUserId,
                onTap: () => _handleChatTap(context, chat, otherUserId, currentUserId),
              ),
            );
          },
        );
      },
    );
  }

  // Extracted method for better performance
  void _handleChatTap(BuildContext context, ChatRoomModel chat, String otherUserId, String currentUserId) {
    final otherUserName = chat.participantsName?[otherUserId]?['pseudo'] ?? 'Unknown';
    final otherUserImage = chat.participantsName?[otherUserId]?['imgURL'] ?? '';
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.to(
        () => ChatScreen(
          imgURL: otherUserImage,
          receiverId: otherUserId,
          receiverName: otherUserName,
        ),
      );
    });
  }
}
