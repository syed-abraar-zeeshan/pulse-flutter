import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/core/network/dio_provider.dart';
import 'package:pulse_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:pulse_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pulse_flutter/features/auth/data/services/auth_service.dart';
import 'package:pulse_flutter/features/auth/data/services/auth_service_impl.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthServiceImpl(apiService);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.read(authServiceProvider);

  return AuthRepositoryImpl(authService);
});
