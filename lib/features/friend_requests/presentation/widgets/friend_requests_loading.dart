import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/features/friend_requests/data/placeholder/friend_request_placeholders.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/widgets/friend_requests_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendRequestsLoading extends StatelessWidget {
  const FriendRequestsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        duration: Duration(milliseconds: 1200),
        baseColor: AppColors.skeletonBase(context),
        highlightColor: AppColors.skeletonHighlight(context),
      ),
      child: FriendRequestsList(requests: friendRequestPlaceholders),
    );
  }
}
