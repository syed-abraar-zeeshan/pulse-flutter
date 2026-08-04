import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';

class EmptySearchResult extends StatelessWidget {
  final VoidCallback? onClearSearch;

  const EmptySearchResult({super.key, this.onClearSearch});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: AppSizes.iconXxl,
                color: AppColors.textSecondary(context),
              ),

              const SizedBox(height: AppSizes.md),

              Text(
                AppStrings.noSearchResults,
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textPrimary(context),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.sm),

              Text(
                AppStrings.noSearchResultsMessage,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary(context),
                ),
                textAlign: TextAlign.center,
              ),

              if (onClearSearch != null) ...[
                const SizedBox(height: AppSizes.lg),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onClearSearch,
                    child: const Text(AppStrings.clearSearch),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
