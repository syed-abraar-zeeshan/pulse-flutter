import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';

class EmptyFriendRequests extends StatelessWidget {
  const EmptyFriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_add_disabled_rounded,
              size: AppSizes.iconXxl,
              color: AppColors.textSecondary(context),
            ),

            const SizedBox(height: AppSizes.lg),

            Text(
              AppStrings.noFriendRequests,
              style: AppTextStyles.titleLarge,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.sm),

            Text(
              AppStrings.noPendingFriendRequests,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary(context),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.xl),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: Text(AppStrings.findFriends),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
