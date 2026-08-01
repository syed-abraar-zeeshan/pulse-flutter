import 'package:pulse_flutter/features/auth/data/models/user_model.dart';

class ProfileState {
  final bool isLoading;
  final UserModel? user;
  final String? errorMessage;

  const ProfileState({this.isLoading = false, this.user, this.errorMessage});

  ProfileState copyWith({
    bool? isLoading,
    UserModel? user,
    String? errorMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
