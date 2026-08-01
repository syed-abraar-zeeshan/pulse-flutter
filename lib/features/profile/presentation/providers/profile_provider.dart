import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:pulse_flutter/features/profile/data/repositories/profile_repository.dart';
import 'package:pulse_flutter/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:pulse_flutter/features/profile/data/services/profile_service.dart';
import 'package:pulse_flutter/features/profile/data/services/profile_service_impl.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return ProfileServiceImpl(apiService);
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileService = ref.read(profileServiceProvider);
  return ProfileRepositoryImpl(profileService);
});
