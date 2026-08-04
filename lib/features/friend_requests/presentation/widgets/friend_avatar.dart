import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';

class FriendAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const FriendAvatar({
    super.key,
    this.imageUrl = '',
    this.radius = AppSizes.avatarMd,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
      child: imageUrl.isEmpty ? const Icon(Icons.person) : null,
    );
  }
}
