import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/chat/data/repositories/chat_repository.dart';
import 'package:pulse_flutter/features/chat/presentation/providers/chat_provider.dart';
import 'package:pulse_flutter/features/chat/presentation/providers/chat_state.dart';

class ChatNotifier extends Notifier<ChatState>{
late final ChatRepository _chatRepository;


  @override
  ChatState build() {
  _chatRepository = ref.read(chatRepositoryProvider);
  return const ChatState();
  }

   Future<void> getConversations() async {
    debugPrint("Fetching conversations...");
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final conversations = await _chatRepository.getConversations();
      debugPrint("conversations fetched: ${conversations.length}");
      state = state.copyWith(isLoading: false, conversations: conversations);
    } catch (e) {
      debugPrint("Error: $e");
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final chatNotifierProvider = NotifierProvider<ChatNotifier, ChatState>(ChatNotifier.new);