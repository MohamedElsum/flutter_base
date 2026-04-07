import 'package:go_router/go_router.dart';
import 'package:flutter_base/app/router/route_names.dart';
import 'package:flutter_base/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_base/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_base/features/home/presentation/pages/home_page.dart';
import 'package:flutter_base/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  final bool isLoggedIn;

  AppRouter({this.isLoggedIn = false});

  late final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == RouteNames.login ||
          state.matchedLocation == RouteNames.register;

      if (!isLoggedIn && !loggingIn && state.matchedLocation != RouteNames.splash) {
        return RouteNames.login;
      }

      if (isLoggedIn && loggingIn) {
        return RouteNames.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
