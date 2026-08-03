import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';

class FriendState {
  final bool isLoading;
  final List<FriendModel> friends;
  final String? errorMessage;

  const FriendState({
    this.isLoading = false,
    this.friends = const [],
    this.errorMessage,
  });

  FriendState copyWith({
    bool? isLoading,
    List<FriendModel>? friends,
    String? errorMessage,
  }) {
    return FriendState(
      isLoading: isLoading ?? this.isLoading,
      friends: friends ?? this.friends,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
