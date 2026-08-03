class FriendModel {
  final String id;
  final String name;
  final String email;
  final String profilePicture;

  const FriendModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
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

  FriendModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profilePicture,
  }) {
    return FriendModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  String toString() {
    return 'FriendModel(id: $id, name: $name, email: $email)';
  }
}
