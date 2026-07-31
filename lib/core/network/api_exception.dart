import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioException(DioException dioException) {
    String message = 'An unexpected error occurred. Please try again.';
    final statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout. Please try again.';
        break;
      case DioExceptionType.transformTimeout:
        message = 'Data transformation timeout. Please try again.';
        break;
      case DioExceptionType.badCertificate:
        message = 'Secure connection failed. Please contact support.';
        break;
      case DioExceptionType.badResponse:
        final response = dioException.response;
        if (response != null) {
          // Attempt to extract server's error message first
          final data = response.data;
          String? serverMessage;
          if (data is Map) {
            serverMessage =
                data['message']?.toString() ?? data['error']?.toString();
          }

          if (serverMessage != null && serverMessage.trim().isNotEmpty) {
            message = serverMessage;
          } else {
            // Fallback status-code based messages
            if (statusCode == 409) {
              message = 'User already exists.';
            } else if (statusCode == 401) {
              message = 'Invalid email or password.';
            } else if (statusCode == 400) {
              message = 'Invalid request parameters.';
            } else if (statusCode == 403) {
              message = 'Access denied.';
            } else if (statusCode == 404) {
              message = 'Requested resource not found.';
            } else if (statusCode != null && statusCode >= 500) {
              message = 'Server error. Please try again later.';
            } else {
              message =
                  'Error ($statusCode): ${response.statusMessage ?? "Something went wrong"}';
            }
          }
        }
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled.';
        break;
      case DioExceptionType.connectionError:
        message =
            'Cannot connect to the server. Please check your internet connection and try again.';
        break;
      case DioExceptionType.unknown:
        final errorStr = dioException.error?.toString() ?? '';
        if (errorStr.contains('SocketException')) {
          message =
              'No internet connection. Please connect to the internet and try again.';
        } else {
          message = dioException.message ?? message;
        }
        break;
    }

    return ApiException(message, statusCode: statusCode);
  }

  @override
  String toString() => message;
}
