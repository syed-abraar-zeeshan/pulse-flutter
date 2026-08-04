import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';

class FriendRequestState {
  final bool isLoading;
  final List<FriendRequestModel> requests;
  final String? errorMessage;

  const FriendRequestState({
    this.isLoading = false,
    this.requests = const [],
    this.errorMessage,
  });

  FriendRequestState copyWith({
    bool? isLoading,
    List<FriendRequestModel>? requests,
    String? errorMessage,
  }) {
    return FriendRequestState(
      isLoading: isLoading ?? this.isLoading,
      requests: requests ?? this.requests,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
