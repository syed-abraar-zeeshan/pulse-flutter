import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';

final friendPlaceholders = List.generate(
  8,
  (_) => const FriendModel(
    id: '',
    name: 'Alexander Robertson',
    email: 'alexander.robertson@gmail.com',
    profilePicture: '',
  ),
);
