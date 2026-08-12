import 'package:pulse_flutter/features/chat/data/models/conversation_model.dart';

class ChatState {
  final bool isLoading;
  final List<ConversationModel> conversations;
  final String? errorMessage;

  const ChatState({
    this.isLoading = false,
    this.conversations = const [],
    this.errorMessage,
  });

  ChatState copyWith({
    bool? isLoading,
    List<ConversationModel>? conversations,
    String? errorMessage,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      conversations: conversations ?? this.conversations,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}