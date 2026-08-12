import 'package:pulse_flutter/features/chat/data/models/conversation_model.dart';

abstract class ChatService {
  Future<List<ConversationModel>> getConversations();
}