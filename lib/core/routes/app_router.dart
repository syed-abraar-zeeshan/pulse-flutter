import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/routes/route_constants.dart';
import 'package:pulse_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:pulse_flutter/features/auth/presentation/screens/signup_screen.dart';
import 'package:pulse_flutter/features/auth/presentation/screens/splash_screen.dart';
import 'package:pulse_flutter/features/friend_requests/presentation/screens/friend_requests_screen.dart';
import 'package:pulse_flutter/features/navigation/presentation/screens/bottom_navigation_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteConstants.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RouteConstants.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: RouteConstants.signup,
        builder: (context, state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        path: RouteConstants.home,
        builder: (context, state) {
          // return const HomeScreen();
          return const BottomNavigationScreen();
        },
      ),
      GoRoute(
        path: RouteConstants.friendRequests,
        builder: (context, state) => const FriendRequestsScreen(),
      ),
    ],
  );
}
