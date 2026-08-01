import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/profile/data/repositories/profile_repository.dart';
import 'package:pulse_flutter/features/profile/presentation/providers/profile_provider.dart';
import 'package:pulse_flutter/features/profile/presentation/providers/profile_state.dart';

class ProfileNotifier extends Notifier<ProfileState> {
  late final ProfileRepository _profileRepository;

  @override
  ProfileState build() {
    _profileRepository = ref.read(profileRepositoryProvider);
    return const ProfileState();
  }

  Future<void> fetchUserProfile() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      final user = await _profileRepository.getUserProfile();
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final profileNotifierProvider = NotifierProvider<ProfileNotifier, ProfileState>(
  ProfileNotifier.new,
);
