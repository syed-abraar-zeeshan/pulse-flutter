import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';

class EmptyFriendRequests extends StatelessWidget {
  const EmptyFriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.person_add_disabled_rounded,
            size: 72,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: AppSizes.md),
          Text(AppStrings.noFriendRequests, style: AppTextStyles.titleLarge),
          SizedBox(height: AppSizes.sm),
          Text(
            AppStrings.noPendingFriendRequests,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
