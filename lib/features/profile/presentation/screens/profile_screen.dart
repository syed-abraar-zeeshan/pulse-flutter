import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/theme/app_colors.dart';
import 'package:pulse_flutter/core/theme/app_text_styles.dart';
import 'package:pulse_flutter/features/profile/presentation/providers/profile_notifier.dart';
import 'package:pulse_flutter/shared/profile_tile.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(profileNotifierProvider.notifier).fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          final user = state.user;

          if (user == null) {
            return const Center(child: Text("No User Found"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                /// Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryLight,
                  backgroundImage: user.profilePicture.isNotEmpty
                      ? NetworkImage(user.profilePicture)
                      : null,
                  child: user.profilePicture.isEmpty
                      ? Text(
                          user.name[0].toUpperCase(),
                          style: AppTextStyles.headlineLarge.copyWith(
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),

                const SizedBox(height: AppSizes.md),

                Text(user.name, style: AppTextStyles.headlineMedium),

                const SizedBox(height: AppSizes.xs),

                Text(user.email, style: AppTextStyles.bodyMedium),

                const SizedBox(height: AppSizes.xl),

                ProfileTile(
                  icon: Icons.email_outlined,
                  title: "Email",
                  value: user.email,
                ),

                const SizedBox(height: AppSizes.md),

                ProfileTile(
                  icon: Icons.phone_outlined,
                  title: "Phone",
                  value: user.phoneNumber,
                ),

                const SizedBox(height: AppSizes.md),

                ProfileTile(
                  icon: Icons.person_outline,
                  title: "Bio",
                  value: user.bio.isEmpty ? "No bio added" : user.bio,
                ),

                const SizedBox(height: AppSizes.md),

                ProfileTile(
                  icon: Icons.circle,
                  title: "Status",
                  value: user.isOnline ? "Online" : "Offline",
                  valueColor: user.isOnline
                      ? AppColors.success
                      : AppColors.error,
                ),

                const SizedBox(height: AppSizes.xxl),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Edit Profile"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
