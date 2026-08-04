class FriendRequestModel {
  final String id;
  final String name;
  final String email;
  final String profilePicture;

  const FriendRequestModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) {
    return FriendRequestModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
    };
  }
}
