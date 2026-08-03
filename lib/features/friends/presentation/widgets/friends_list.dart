import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/features/friends/data/models/friend_model.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friend_tile.dart';

class FriendsList extends StatelessWidget {
  final List<FriendModel> friends;

  const FriendsList({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: friends.length,
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.sm),
      itemBuilder: (context, index) {
        final friend = friends[index];

        return FriendTile(
          name: friend.name,
          subtitle: friend.email,
          imageUrl: friend.profilePicture,
          isOnline: false,
          onTap: () {},
        );
      },
    );
  }
}
