class LastMessageModel {
  final String content;
  final String type;
  final DateTime sentAt;

  const LastMessageModel({
    required this.content,
    required this.type,
    required this.sentAt,
  });

  factory LastMessageModel.fromJson(Map<String, dynamic> json) {
    return LastMessageModel(
      content: json['content'] as String,
      type: json['type'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
    );
  }
}
