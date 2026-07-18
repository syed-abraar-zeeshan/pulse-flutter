import 'package:pulse_flutter/features/auth/data/models/user_model.dart';

class AuthResponse {
  final bool success;
  final String message;
  final UserModel user;

  const AuthResponse({
    required this.success,
    required this.message,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'],
      message: json['message'],
      user: UserModel.fromJson(json['data']),
    );
  }
}
