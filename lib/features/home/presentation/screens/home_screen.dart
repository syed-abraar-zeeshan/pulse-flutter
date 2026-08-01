import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/friend_requests_section.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/greeting_header.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/quick_actions_grid.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/recent_chats_section.dart';
import 'package:pulse_flutter/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:pulse_flutter/features/profile/presentation/providers/profile_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            GreetingHeader(userName: profile.user?.name ?? ''),
            const SizedBox(height: AppSizes.lg),
            SearchBarWidget(
              onTap: () {
                // Navigate to Search Screen later
              },
            ),
            const SizedBox(height: AppSizes.lg),
            const QuickActionsGrid(),
            const SizedBox(height: AppSizes.md),
            const FriendRequestsSection(),
            const SizedBox(height: AppSizes.xl),

            const RecentChatsSection(),

            const SizedBox(height: AppSizes.xl),
          ],
        ),
      ),
    );
  }
}
