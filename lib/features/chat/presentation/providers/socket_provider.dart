import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/features/chat/data/services/socket_service.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketService();
});
