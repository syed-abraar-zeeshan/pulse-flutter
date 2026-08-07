import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/providers/friend_request_notifier.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/empty_friend_requests.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_requests_list.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_requests_loading.dart';
import 'package:pulse_flutter/shared/widgets/app_error_widget.dart';

class FriendRequestsScreen extends ConsumerStatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  ConsumerState<FriendRequestsScreen> createState() =>
      _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends ConsumerState<FriendRequestsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch friend requests when the screen is initialized
      ref.read(friendRequestNotifierProvider.notifier).getFriendRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(friendRequestNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.friendRequests)),
      body: state.isLoading
          ? const FriendRequestsLoading()
          : state.errorMessage != null
          ? AppErrorWidget(
              title: AppStrings.friendsErrorTitle,
              message: state.errorMessage!,
              onRetry: () {
                ref
                    .read(friendRequestNotifierProvider.notifier)
                    .getFriendRequests();
              },
            )
          : state.requests.isEmpty
          ? const EmptyFriendRequests()
          : RefreshIndicator(
              onRefresh: () {
                return ref
                    .read(friendRequestNotifierProvider.notifier)
                    .getFriendRequests();
              },
              child: FriendRequestsList(requests: state.requests),
            ),
    );
  }
}
