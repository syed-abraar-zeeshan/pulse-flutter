import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';

class FriendAvatar extends StatelessWidget {
  final String? imageUrl;
  final bool isOnline;
  final double radius;

  const FriendAvatar({
    super.key,
    this.imageUrl,
    this.isOnline = false,
    this.radius = AppSizes.avatarMd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary.withValues(alpha: 0.1),
          backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
          child: imageUrl == null || imageUrl!.isEmpty
              ? Icon(
                  Icons.person,
                  size: radius * AppSizes.avatarIconScale,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
        ),

        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.40,
              height: radius * 0.40,
              decoration: BoxDecoration(
                color: AppColors.online,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
