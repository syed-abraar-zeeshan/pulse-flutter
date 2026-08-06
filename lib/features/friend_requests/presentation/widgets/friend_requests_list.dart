import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/features/friend_requests/data/models/friend_request_model.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/providers/friend_request_notifier.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_request_tile.dart';
import 'package:pulse_flutter/shared/widgets/custom_snackbar.dart';

class FriendRequestsList extends ConsumerWidget {
  final List<FriendRequestModel> requests;

  const FriendRequestsList({super.key, required this.requests});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onAccept: () async {
            final success = await ref
                .read(friendRequestNotifierProvider.notifier)
                .acceptFriendRequest(request.id);

            if (success && context.mounted) {
              CustomSnackbar.showSuccess(
                context,
                "Friend request accepted successfully",
              );
            }
          },
          onReject: () {
            // TODO: Reject request
          },
        );
      },
    );
  }
}
