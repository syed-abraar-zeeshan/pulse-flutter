class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String bio;
  final String profilePicture;
  final bool isOnline;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    required this.profilePicture,
    required this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      bio: json['bio'],
      profilePicture: json['profilePicture'],
      isOnline: json['isOnline'],
    );
  }
}
