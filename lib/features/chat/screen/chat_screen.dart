import 'dart:io';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:timirama/features/chat/bloc/chat_state.dart';
import 'package:timirama/features/chat/model/chat_message.dart';
import 'package:timirama/features/chat/widgets/chat_screen_widget.dart';
import 'package:timirama/features/chat/widgets/message_bubble.dart';
import 'package:timirama/features/chat/widgets/voice_recorder.dart';
import 'package:timirama/services/service_locator/service_locator.dart';
import 'package:timirama/services/status/bloc/status_bloc.dart';
import 'package:timirama/services/status/bloc/status_event.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

// ----------individual chat screen ------------------
class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String receiverName;
  final String imgURL;
  final String? preMessage;

  const ChatScreen({
    Key? key,
    required this.receiverId,
    required this.receiverName,
    required this.imgURL,
    this.preMessage,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final WaveformRecorderController _waveController =
      WaveformRecorderController();
  bool _isComposing = false;
  bool _showEmoji = false;

  List<ChatMessage> _previousMessages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(InitializeChatEvent(widget.receiverId));
    context.read<StatusBloc>().add(GetStatus(uid: widget.receiverId));

    if (widget.preMessage != null && widget.preMessage!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ChatBloc>().add(
              SendMessage(
                content: widget.preMessage!,
                receiverId: widget.receiverId,
              ),
            );
      });
    }
    messageController.addListener(_onTextChanged);
    _scrollController.addListener(_onScroll);
  }

  void _onTextChanged() {
    final isComposing = messageController.text.isNotEmpty;
    if (isComposing != _isComposing) {
      setState(() => _isComposing = isComposing);
      if (isComposing) {
        context.read<ChatBloc>().add(StartTyping());
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ChatBloc>().add(LoadMoreMessages());
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _hasNewMessages(List<ChatMessage> messages) {
    if (messages.length != _previousMessages.length) {
      _scrollToBottom();
      _previousMessages = messages;
    }
  }

  void _handleSendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatBloc>().add(
            SendMessage(content: text, receiverId: widget.receiverId),
          );
      messageController.clear();
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    messageController.dispose();
    _scrollController.dispose();
    getIt<ChatBloc>().add(LeaveChat());

    super.dispose();
  }

  Future<void> _toggleRecording() async {
    try {
      if (_waveController.isRecording) {
        await _waveController.stopRecording();
        debugPrint("Stopped recording");
      } else {
        await _waveController.startRecording();
        debugPrint("Started recording");
      }
      setState(() {});
    } catch (e) {
      debugPrint("Error in toggleRecording: $e");
      // Optionally show a snackbar
    }
  }

  Future<void> _cancelRecording() async {
    try {
      if (_waveController.isRecording || _waveController.isPaused) {
        await _waveController.cancelRecording();

        print("Cancel Record!");
      } else {
        print("Recording is not active. Nothing to cancel.");
      }

      setState(() {});
    } catch (e) {
      print("Error while canceling record: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isValideUrl = widget.imgURL.isNotEmpty &&
        Uri.tryParse(widget.imgURL)!.hasAbsolutePath == true;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        //---------Chat Screen PlatformAppBar-----------------
        child: ChatScreenAppBar(isValideUrl: isValideUrl, widget: widget),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) => _hasNewMessages(state.messages),
        builder: (context, state) {
          if (state.status == ChatStatus.error) {
            print("Error in Chat Screen : ${state.error}");
            return Center(
              child: Text(state.error!),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    final isMe = message.senderId ==
                        FirebaseAuth.instance.currentUser?.uid;
                    return MessageBubble(message: message, isMe: isMe);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _waveController.isRecording
                            ? SizedBox.shrink()
                            : PlatformIconButton(
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {
                                  setState(() => _showEmoji = !_showEmoji);
                                  if (_showEmoji) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                        _waveController.isRecording
                            ? VoiceRecord(
                                receiverId: widget.receiverId,
                                onCancel: _cancelRecording,
                                waveformRecorderController: _waveController,
                              )
                            : Flexible(
                                child: TextField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.black),
                                  // Fills available vertical space
                                  maxLines:
                                      5, // Must be null when expands is true
                                  minLines: 1,
                                  keyboardType: TextInputType.text,
                                  controller: messageController,
                                  onTap: () {
                                    if (_showEmoji) {
                                      setState(() => _showEmoji = false);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    isDense: true,
                                    errorMaxLines: 3,
                                    hintText: EnumLocale.messagesHint.name.tr,
                                    hintStyle: theme.bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: BorderSide(
                                        width: 1.w,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: BorderSide(
                                        width: 1.w,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),

                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                        if (_isComposing)
                          IconButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.primaryColor,
                              ),
                            ),
                            icon: Icon(
                              Icons.send,
                              color: AppColors.floralWhite,
                            ),
                            onPressed: _handleSendMessage,
                          ),
                        if (!_isComposing)
                          IconButton(
                            onPressed: _toggleRecording,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.primaryColor,
                              ),
                            ),
                            icon: Icon(
                              _waveController.isRecording
                                  ? Icons.send_outlined
                                  : Icons.mic_outlined,
                              color: AppColors.floralWhite,
                            ),
                          ),
                      ],
                    ),
                    if (_showEmoji)
                      SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          textEditingController: messageController,
                          onEmojiSelected: (category, emoji) {
                            messageController.text += emoji.emoji;
                            messageController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                offset: messageController.text.length,
                              ),
                            );
                            setState(
                              () => _isComposing =
                                  messageController.text.isNotEmpty,
                            );
                          },
                          config: Config(
                            emojiViewConfig: EmojiViewConfig(
                              emojiSizeMax:
                                  32.0 * (Platform.isIOS ? 1.30 : 1.0),
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                            ),
                            categoryViewConfig: const CategoryViewConfig(
                              initCategory: Category.RECENT,
                            ),
                            bottomActionBarConfig: BottomActionBarConfig(
                              enabled: true,
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
