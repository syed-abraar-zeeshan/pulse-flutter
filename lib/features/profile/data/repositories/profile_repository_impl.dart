import 'package:pulse_flutter/features/auth/data/models/user_model.dart';
import 'package:pulse_flutter/features/profile/data/repositories/profile_repository.dart';
import 'package:pulse_flutter/features/profile/data/services/profile_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl(this._profileService);

  @override
  Future<UserModel> getUserProfile() async {
    return await _profileService.getUserProfile();
  }
}
