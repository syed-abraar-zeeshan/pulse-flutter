import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';
import 'package:pulse_flutter/features/friend_requests/data/services/friend_request_service.dart';

class FriendRequestServiceImpl implements FriendRequestService {
  final ApiService _apiService;

  FriendRequestServiceImpl(this._apiService);

  @override
  Future<List<FriendRequestModel>> getFriendRequests() async {
    final response = await _apiService.get(ApiEndpoints.friendRequests);
    final List<dynamic> requestsJson = response.data['data'];

    return requestsJson
        .map((json) => FriendRequestModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> acceptFriendRequest(String requestId) async {
    await _apiService.post('${ApiEndpoints.friendAccept}/$requestId');
  }
}
