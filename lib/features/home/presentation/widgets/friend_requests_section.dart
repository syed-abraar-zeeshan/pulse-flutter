import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/friend_request_tile.dart';

class FriendRequestsSection extends StatelessWidget {
  const FriendRequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),

        const SizedBox(height: AppSizes.md),

        FriendRequestTile(
          name: 'Rahul Sharma',
          subtitle: 'Wants to connect with you',
          requestTime: '2h ago',
          onAccept: () {
            debugPrint('Accepted Rahul');
          },
          onDecline: () {
            debugPrint('Declined Rahul');
          },
        ),

        const SizedBox(height: AppSizes.md),

        FriendRequestTile(
          name: 'Priya Singh',
          subtitle: 'Wants to connect with you',
          requestTime: '2h ago',
          onAccept: () {
            debugPrint('Accepted Priya');
          },
          onDecline: () {
            debugPrint('Declined Priya');
          },
        ),

        const SizedBox(height: AppSizes.md),

        FriendRequestTile(
          name: 'Ankit Verma',
          subtitle: 'Wants to connect with you',
          requestTime: '2h ago',
          onAccept: () {
            debugPrint('Accepted Ankit');
          },
          onDecline: () {
            debugPrint('Declined Ankit');
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.friendRequests, style: theme.textTheme.titleLarge),
        TextButton(
          onPressed: () {
            debugPrint('See All Friend Requests');
          },
          child: const Text(AppStrings.seeAll),
        ),
      ],
    );
  }
}
