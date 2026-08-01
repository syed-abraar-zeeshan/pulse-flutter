import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),

            const SizedBox(width: AppSizes.md),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodySmall),

                  const SizedBox(height: AppSizes.xs),

                  Text(
                    value,
                    style: AppTextStyles.bodyLarge.copyWith(color: valueColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
