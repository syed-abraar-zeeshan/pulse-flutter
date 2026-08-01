import 'package:dio/dio.dart';
import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/dio_interceptors.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(DioInterceptor());
  }
}
