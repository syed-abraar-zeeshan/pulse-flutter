import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/routes/route_constants.dart';
import 'package:pulse_flutter/core/storage/secure_storage_service.dart';
import 'package:pulse_flutter/features/profile/presentation/providers/profile_notifier.dart';

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

    if (!mounted) return;

    // No token
    if (token == null) {
      context.go(RouteConstants.login);
      return;
    }

    // Token exists
    final success = await ref
        .read(profileNotifierProvider.notifier)
        .fetchUserProfile();

    if (!mounted) return;

    if (success) {
      context.go(RouteConstants.home);
    } else {
      await SecureStorageService.clear();
      context.go(RouteConstants.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Pulse')));
  }
}
