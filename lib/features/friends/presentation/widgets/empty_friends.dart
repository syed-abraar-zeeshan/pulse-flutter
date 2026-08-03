import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';

class EmptyFriends extends StatelessWidget {
  const EmptyFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline_rounded,
              size: 72,
              color: AppColors.textSecondary(context),
            ),

            const SizedBox(height: AppSizes.lg),

            Text(
              AppStrings.noFriendsYet,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            Text(
              AppStrings.startConnecting,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
