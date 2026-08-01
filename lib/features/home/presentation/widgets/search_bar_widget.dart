import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchBarWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: AppStrings.searchUsers,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
