import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:pulse_flutter/features/chat/data/repositories/chat_repository.dart';
import 'package:pulse_flutter/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:pulse_flutter/features/chat/data/services/chat_service.dart';
import 'package:pulse_flutter/features/chat/data/services/chat_service_impl.dart';

final chatServiceProvider = Provider<ChatService>((ref) {
  final apiService = ref.read(apiServiceProvider);

  return ChatServiceImpl(apiService);
});

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final chatService = ref.read(chatServiceProvider);

  return ChatRepositoryImpl(chatService);
});