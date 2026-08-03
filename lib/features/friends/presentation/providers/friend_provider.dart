import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:pulse_flutter/features/friends/data/repositories/friend_repository.dart';
import 'package:pulse_flutter/features/friends/data/repositories/friend_repository_impl.dart';
import 'package:pulse_flutter/features/friends/data/services/friend_service.dart';
import 'package:pulse_flutter/features/friends/data/services/friend_service_impl.dart';

final friendServiceProvider = Provider<FriendService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return FriendServiceImpl(apiService);
});

final friendRepositoryProvider = Provider<FriendRepository>((ref) {
  final friendService = ref.read(friendServiceProvider);
  return FriendRepositoryImpl(friendService);
});
