import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';

abstract class FriendRequestRepository {
  Future<List<FriendRequestModel>> getFriendRequests();
  Future<void> acceptFriendRequest(String requestId);
}
