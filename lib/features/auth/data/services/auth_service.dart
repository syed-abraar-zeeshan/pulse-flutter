import 'package:pulse_flutter/features/auth/data/models/auth_response.dart';
import 'package:pulse_flutter/features/auth/data/models/login_request.dart';
import 'package:pulse_flutter/features/auth/data/models/signup_request.dart';

abstract class AuthService {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> signup(SignupRequest request);
}
