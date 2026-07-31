import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/auth/data/models/login_request.dart';
import 'package:pulse_flutter/features/auth/data/models/signup_request.dart';
import '../../data/repositories/auth_repository.dart';
import 'auth_provider.dart';
import 'auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);

    return const AuthState();
  }

  Future<void> signup({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSuccess: false,
      );

      final request = SignupRequest(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      await _repository.signup(request);

      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSuccess: false,
      );

      final request = LoginRequest(email: email, password: password);

      await _repository.login(request);

      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetState() {
    state = const AuthState();
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

final loginNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

final signupNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
