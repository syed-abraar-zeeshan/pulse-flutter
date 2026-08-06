import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';
import 'package:pulse_flutter/features/friend_requests/data/repositories/friend_request_repository.dart';
import 'package:pulse_flutter/features/friend_requests/data/services/friend_request_service.dart';

class FriendRequestRepositoryImpl implements FriendRequestRepository {
  final FriendRequestService _friendRequestService;
  FriendRequestRepositoryImpl(this._friendRequestService);

  @override
  Future<List<FriendRequestModel>> getFriendRequests() async {
    return await _friendRequestService.getFriendRequests();
  }

  @override
  Future<void> acceptFriendRequest(String requestId) async {
    return await _friendRequestService.acceptFriendRequest(requestId);
  }
}
