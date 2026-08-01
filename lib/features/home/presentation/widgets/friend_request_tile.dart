import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';

class FriendRequestTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String? profileImage;
  final String requestTime;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const FriendRequestTile({
    super.key,
    required this.name,
    required this.subtitle,
    this.profileImage,
    required this.requestTime,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(AppSizes.md),
      color: AppColors.card(context),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(AppSizes.md),
          border: Border.all(color: AppColors.border(context)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  backgroundImage: profileImage != null
                      ? NetworkImage(profileImage!)
                      : null,
                  child: profileImage == null
                      ? Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                ),

                const SizedBox(width: AppSizes.md),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium,
                      ),

                      const SizedBox(height: AppSizes.xs),

                      Text(
                        '$subtitle • $requestTime',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary(context),
                        ),
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
                  child: FilledButton(
                    onPressed: onAccept,
                    child: const Text(AppStrings.accept),
                  ),
                ),

                const SizedBox(width: AppSizes.md),

                Expanded(
                  child: OutlinedButton(
                    onPressed: onDecline,
                    child: const Text(AppStrings.decline),
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
