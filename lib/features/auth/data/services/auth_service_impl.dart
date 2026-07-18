import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/features/auth/data/models/auth_response.dart';
import 'package:pulse_flutter/features/auth/data/models/login_request.dart';
import 'package:pulse_flutter/features/auth/data/models/signup_request.dart';
import 'package:pulse_flutter/features/auth/data/services/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final ApiService _apiService;

  AuthServiceImpl(this._apiService);

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _apiService.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> signup(SignupRequest request) async {
    final response = await _apiService.post(
      ApiEndpoints.signup,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }
}
