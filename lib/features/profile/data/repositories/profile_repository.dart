import 'package:pulse_flutter/features/auth/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUserProfile();
}
