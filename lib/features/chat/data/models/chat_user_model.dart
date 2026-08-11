class ChatUserModel {
  final String id;
  final String name;
  final String profilePicture;
  final bool isOnline;

  const ChatUserModel({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.isOnline,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
      isOnline: json['isOnline'] as bool,
    );
  }
}
