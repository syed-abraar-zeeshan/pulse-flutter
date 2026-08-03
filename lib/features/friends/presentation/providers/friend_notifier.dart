import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/friends/data/repositories/friend_repository.dart';
import 'package:pulse_flutter/features/friends/presentation/providers/friend_provider.dart';
import 'package:pulse_flutter/features/friends/presentation/providers/friend_state.dart';

class FriendNotifier extends Notifier<FriendState> {
  late final FriendRepository _repository;

  @override
  FriendState build() {
    _repository = ref.read(friendRepositoryProvider);
    return const FriendState();
  }

  Future<void> getFriends() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final friends = await _repository.getFriends();
      state = state.copyWith(isLoading: false, friends: friends);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> searchFriends(String name) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final friends = await _repository.searchFriends(name);
      state = state.copyWith(isLoading: false, friends: friends);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final friendNotifierProvider = NotifierProvider<FriendNotifier, FriendState>(
  FriendNotifier.new,
);
