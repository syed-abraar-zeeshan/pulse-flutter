import 'package:pulse_flutter/features/auth/data/models/auth_response.dart';
import 'package:pulse_flutter/features/auth/data/models/login_request.dart';
import 'package:pulse_flutter/features/auth/data/models/signup_request.dart';
import 'package:pulse_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:pulse_flutter/features/auth/data/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    return await _authService.login(request);
  }

  @override
  Future<AuthResponse> signup(SignupRequest request) async {
    return await _authService.signup(request);
  }
}
