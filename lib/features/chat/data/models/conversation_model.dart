import 'chat_user_model.dart';
import 'last_message_model.dart';

class ConversationModel {
  final String conversationId;
  final ChatUserModel user;
  final LastMessageModel lastMessage;
  final int unreadCount;

  const ConversationModel({
    required this.conversationId,
    required this.user,
    required this.lastMessage,
    required this.unreadCount,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      conversationId: json['conversationId'] as String,
      user: ChatUserModel.fromJson(json['user'] as Map<String, dynamic>),
      lastMessage: LastMessageModel.fromJson(
        json['lastMessage'] as Map<String, dynamic>,
      ),
      unreadCount: json['unreadCount'] as int,
    );
  }
}
