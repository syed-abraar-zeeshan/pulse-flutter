import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/routes/route_constants.dart';
import 'package:pulse_flutter/core/storage/secure_storage_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final token = await SecureStorageService.getToken();

    debugPrint("Token: $token");

    if (!mounted) return;

    if (token == null) {
      debugPrint("Navigating to Login");
      context.go(RouteConstants.login);
    } else {
      debugPrint("Navigating to Home");
      context.go(RouteConstants.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Pulse')));
  }
}
