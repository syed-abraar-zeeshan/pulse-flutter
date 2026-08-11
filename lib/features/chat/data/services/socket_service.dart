import 'package:pulse_flutter/core/storage/secure_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  Future<void> connect() async {
    final token = await SecureStorageService.getToken();

    if (token == null) {
      print('No authentication token found');
      return;
    }

    socket = IO.io(
      'https://easing-flanked-molar.ngrok-free.dev',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'auth': {'token': token},
      },
    );

    socket.onConnect((_) {
      print('Socket connected');
    });

    socket.onConnectError((error) {
      print('Socket connection error: $error');
    });

    socket.on('new_message', (data) {
      print('New message received: $data');
    });

    socket.connect();
  }

  void sendMessage({
    required String receiverId,
    required String messageType,
    required String content,
  }) {
    socket.emit('send_message', {
      'receiverId': receiverId,
      'messageType': messageType,
      'content': content,
    });
  }
}
