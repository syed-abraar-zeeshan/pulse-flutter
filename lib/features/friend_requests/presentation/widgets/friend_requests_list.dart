import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_request_tile.dart';

class FriendRequestsList extends StatelessWidget {
  final List<FriendRequestModel> requests;

  const FriendRequestsList({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: requests.length,
      padding: const EdgeInsets.all(AppSizes.md),
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.sm),
      itemBuilder: (context, index) {
        final request = requests[index];

        return FriendRequestTile(
          name: request.name,
          email: request.email,
          imageUrl: request.profilePicture,
          onAccept: () {
            // TODO: Accept request
          },
          onReject: () {
            // TODO: Reject request
          },
        );
      },
    );
  }
}
