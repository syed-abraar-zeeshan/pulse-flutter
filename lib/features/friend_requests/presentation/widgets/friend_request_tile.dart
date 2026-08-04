import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friend_avatar.dart';

class FriendRequestTile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const FriendRequestTile({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FriendAvatar(imageUrl: imageUrl),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.titleMedium,
                      ),
                      const SizedBox(height: AppSizes.xs),
                      Text(
                        email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: AppSizes.buttonHeight,
                    child: OutlinedButton(
                      onPressed: onReject,
                      child: const Text(AppStrings.reject),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: SizedBox(
                    height: AppSizes.buttonHeight,
                    child: ElevatedButton(
                      onPressed: onAccept,
                      child: const Text(AppStrings.accept),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
