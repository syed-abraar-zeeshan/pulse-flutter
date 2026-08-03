import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';

abstract class FriendService {
  Future<List<FriendModel>> getFriends();
  Future<List<FriendModel>> searchFriends(String name);
}
