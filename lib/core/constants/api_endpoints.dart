class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://easing-flanked-molar.ngrok-free.dev';

  static const String login = '/api/auth/login';

  static const String signup = '/api/auth/signup';

  static const String getUserProfile = '/api/profile';

  static const String friends = '/api/friends/';

  static const String friendRequests = '/api/friends/requests';

  static String searchFriends(String name) => '/api/friends/search?name=$name';

  static const String acceptFriend = "/api/friends/accept";

  static const String rejectFriend = "/api/friends/reject";

  static const String getConversations = "/api/chat/conversations";
}
