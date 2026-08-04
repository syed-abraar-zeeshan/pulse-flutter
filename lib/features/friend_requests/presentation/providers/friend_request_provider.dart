import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:pulse_flutter/features/friend_requests/data/repositories/friend_request_repository.dart';
import 'package:pulse_flutter/features/friend_requests/data/repositories/friend_request_repository_impl.dart';
import 'package:pulse_flutter/features/friend_requests/data/services/friend_request_service.dart';
import 'package:pulse_flutter/features/friend_requests/data/services/friend_request_service_impl.dart';

final friendRequestServiceProvider = Provider<FriendRequestService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return FriendRequestServiceImpl(apiService);
});

final friendRequestRepositoryProvider = Provider<FriendRequestRepository>((
  ref,
) {
  final friendRequestService = ref.read(friendRequestServiceProvider);
  return FriendRequestRepositoryImpl(friendRequestService);
});
