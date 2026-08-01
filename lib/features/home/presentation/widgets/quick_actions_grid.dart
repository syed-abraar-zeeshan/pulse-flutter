import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/action_card.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Row
        Row(
          children: [
            Expanded(
              child: ActionCard(
                icon: Icons.people_alt_outlined,
                title: AppStrings.friends,
                onTap: () {
                  debugPrint('Friends');
                },
              ),
            ),

            const SizedBox(width: AppSizes.md),

            Expanded(
              child: ActionCard(
                icon: Icons.chat_bubble_outline,
                title: AppStrings.chats,
                onTap: () {
                  debugPrint('Chats');
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSizes.md),

        // Second Row
        Row(
          children: [
            Expanded(
              child: ActionCard(
                icon: Icons.favorite_border,
                title: AppStrings.requests,
                onTap: () {
                  debugPrint('Requests');
                },
              ),
            ),

            const SizedBox(width: AppSizes.md),

            Expanded(
              child: ActionCard(
                icon: Icons.person_outline,
                title: AppStrings.profile,
                onTap: () {
                  debugPrint('Profile');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
