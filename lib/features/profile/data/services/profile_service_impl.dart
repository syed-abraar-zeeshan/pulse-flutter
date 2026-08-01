import 'package:pulse_flutter/core/constants/api_endpoints.dart';
import 'package:pulse_flutter/core/network/api_service.dart';
import 'package:pulse_flutter/features/auth/data/models/user_model.dart';
import 'package:pulse_flutter/features/profile/data/services/profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  final ApiService _apiService;

  ProfileServiceImpl(this._apiService);

  @override
  Future<UserModel> getUserProfile() async {
    final response = await _apiService.get(ApiEndpoints.getUserProfile);

    return UserModel.fromJson(response.data['data']);
  }
}
