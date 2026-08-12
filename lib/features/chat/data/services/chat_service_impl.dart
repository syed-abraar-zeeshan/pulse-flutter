import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/features/chat/data/models/conversation_model.dart';
import 'package:pulse_flutter/features/chat/data/services/chat_service.dart';

class ChatServiceImpl implements ChatService {
  final ApiService _apiService;

  ChatServiceImpl(this._apiService);

  @override
  Future<List<ConversationModel>> getConversations() async {
    final response = await _apiService.get(
      ApiEndpoints.getConversations,
    );

    final List<dynamic> data = response.data['data'];

    return data
        .map(
          (json) => ConversationModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}