import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/friend_requests/data/repositories/friend_request_repository.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/providers/friend_request_provider.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/providers/friend_request_state.dart';

class FriendRequestNotifier extends Notifier<FriendRequestState> {
  late final FriendRequestRepository _friendRequestRepository;

  @override
  FriendRequestState build() {
    _friendRequestRepository = ref.read(friendRequestRepositoryProvider);
    return const FriendRequestState();
  }

  Future<void> getFriendRequests() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final requests = await _friendRequestRepository.getFriendRequests();
      debugPrint("Received ${requests.length} requests");
      state = state.copyWith(isLoading: false, requests: requests);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final friendRequestNotifierProvider =
    NotifierProvider<FriendRequestNotifier, FriendRequestState>(
      FriendRequestNotifier.new,
    );
