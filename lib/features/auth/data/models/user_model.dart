class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String bio;
  final String profilePicture;
  final bool isOnline;

  final List<String> friendRequests;
  final List<String> friends;

  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    required this.profilePicture,
    required this.isOnline,
    required this.friendRequests,
    required this.friends,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      bio: json['bio'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      isOnline: json['isOnline'] ?? false,

      friendRequests: List<String>.from(json['friendRequests'] ?? []),
      friends: List<String>.from(json['friends'] ?? []),

      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
