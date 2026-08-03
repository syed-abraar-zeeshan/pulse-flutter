import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';
import 'package:pulse_flutter/features/friends/data/repositories/friend_repository.dart';
import 'package:pulse_flutter/features/friends/data/services/friend_service.dart';

class FriendRepositoryImpl implements FriendRepository {
  final FriendService _friendService;
  FriendRepositoryImpl(this._friendService);

  @override
  Future<List<FriendModel>> getFriends() async {
    return await _friendService.getFriends();
  }

  @override
  Future<List<FriendModel>> searchFriends(String name) async {
    return await _friendService.searchFriends(name);
  }
}
