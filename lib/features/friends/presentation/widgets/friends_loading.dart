import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/features/friends/data/placeholders/friend_placeholders.dart';
import 'package:pulse_flutter/features/friends/presentation/widgets/friends_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FriendsLoading extends StatelessWidget {
  const FriendsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        duration: Duration(milliseconds: 1200),
        baseColor: AppColors.skeletonBase(context),
        highlightColor: AppColors.skeletonHighlight(context),
      ),
      child: FriendsList(friends: friendPlaceholders),
    );
  }
}
