import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/recent_chat_tile.dart';

class RecentChatsSection extends StatelessWidget {
  const RecentChatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),

        const SizedBox(height: AppSizes.md),

        RecentChatTile(
          name: 'Rahul Sharma',
          lastMessage: 'Hey, are you coming today?',
          time: '2:15 PM',
          unreadCount: 2,
          onTap: () {
            debugPrint('Open Rahul Chat');
          },
        ),

        const SizedBox(height: AppSizes.md),

        RecentChatTile(
          name: 'Priya Singh',
          lastMessage: 'Thank you 😊',
          time: 'Yesterday',
          unreadCount: 0,
          onTap: () {
            debugPrint('Open Priya Chat');
          },
        ),

        const SizedBox(height: AppSizes.md),

        RecentChatTile(
          name: 'Ankit Verma',
          lastMessage: 'See you tomorrow!',
          time: '11:45 AM',
          unreadCount: 5,
          onTap: () {
            debugPrint('Open Ankit Chat');
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.recentChats, style: theme.textTheme.titleLarge),
        TextButton(
          onPressed: () {
            debugPrint('See All Chats');
          },
          child: const Text(AppStrings.seeAll),
        ),
      ],
    );
  }
}
