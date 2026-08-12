import 'package:pulse_flutter/features/chat/data/models/conversation_model.dart';
import 'package:pulse_flutter/features/chat/data/repositories/chat_repository.dart';
import 'package:pulse_flutter/features/chat/data/services/chat_service.dart';

class ChatRepositoryImpl implements ChatRepository{
  final ChatService _chatService;

  ChatRepositoryImpl(this._chatService);

  @override
  Future<List<ConversationModel>> getConversations() async {
   return await _chatService.getConversations();
  }
}