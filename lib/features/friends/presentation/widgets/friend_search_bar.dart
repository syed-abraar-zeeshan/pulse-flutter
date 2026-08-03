import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';

class FriendSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;

  const FriendSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: onTap != null,
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      enableSuggestions: false,
      autocorrect: false,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: AppStrings.searchFriends,
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: AppSizes.md),
      ),
    );
  }
}
