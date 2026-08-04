import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/routes/route_constants.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_requests_card.dart';
import 'package:pulse_flutter/features/friends/presentation/providers/friend_notifier.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/empty_friends.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/empty_search_result.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friend_search_bar.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friends_list.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friends_loading.dart';
import 'package:pulse_flutter/shared/widgets/app_error_widget.dart';

class FriendsScreen extends ConsumerStatefulWidget {
  const FriendsScreen({super.key});

  @override
  ConsumerState<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends ConsumerState<FriendsScreen> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(friendNotifierProvider.notifier).getFriends();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final friendState = ref.watch(friendNotifierProvider);
    final hasFriends = friendState.friends.isNotEmpty;
    final isSearching = _searchController.text.trim().isNotEmpty;

    if (friendState.errorMessage != null) {
      return Scaffold(
        body: AppErrorWidget(
          icon: Icons.people_outline_rounded,
          title: AppStrings.friendsErrorTitle,
          message: friendState.errorMessage!,
          onRetry: () {
            debugPrint("Retry button clicked");
            ref.read(friendNotifierProvider.notifier).getFriends();
          },
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.friends,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.lg),
            FriendSearchBar(
              controller: _searchController,
              onChanged: (name) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  ref.read(friendNotifierProvider.notifier).searchFriends(name);
                });
              },
            ),
            const SizedBox(height: AppSizes.md),
            FriendRequestsCard(
              requestCount: 3, // Temporary hardcoded value
              onTap: () {
                context.push(RouteConstants.friendRequests);
              },
            ),
            const SizedBox(height: AppSizes.xl),
            Text(
              AppStrings.yourFriends,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.md),
            Expanded(
              child: friendState.isLoading
                  ? const FriendsLoading()
                  : hasFriends
                  ? RefreshIndicator(
                      onRefresh: () {
                        return ref
                            .read(friendNotifierProvider.notifier)
                            .refreshFriends();
                      },
                      child: FriendsList(friends: friendState.friends),
                    )
                  : isSearching
                  ? EmptySearchResult(
                      onClearSearch: () {
                        _searchController.clear();

                        ref.read(friendNotifierProvider.notifier).getFriends();

                        setState(() {});
                      },
                    )
                  : const EmptyFriends(),
            ),
          ],
        ),
      ),
    );
  }
}
