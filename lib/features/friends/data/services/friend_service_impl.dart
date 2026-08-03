import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';
import 'package:pulse_flutter/features/friends/data/services/friend_service.dart';

class FriendServiceImpl implements FriendService {
  final ApiService _apiService;

  FriendServiceImpl(this._apiService);

  @override
  Future<List<FriendModel>> getFriends() async {
    final response = await _apiService.get(ApiEndpoints.friends);
    final List<dynamic> friendsJson = response.data['data'];
    return friendsJson.map((json) => FriendModel.fromJson(json)).toList();
  }

  @override
  Future<List<FriendModel>> searchFriends(String name) async {
    final response = await _apiService.get(ApiEndpoints.searchFriends(name));
    final List<dynamic> friendsJson = response.data['data'];
    return friendsJson.map((json) => FriendModel.fromJson(json)).toList();
  }
}
