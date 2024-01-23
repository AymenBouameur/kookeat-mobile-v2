import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/auth/forgot_password/view/forgot_password_view.dart';
import 'package:cookeat/modules/auth/view/auth_view.dart';
import 'package:cookeat/modules/home/view/home_view.dart';
import 'package:cookeat/modules/onboard/view/on_board_view.dart';
import 'package:cookeat/modules/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  /// This method is about the first page to show
  /// after the animated spalshScreen.
  /// Since the [Routes.initial] is the splashScreen.
  static Future<void> initialRoutePage() async {
    var route = Routes.auth;

    if (!SharedPref.getOnBoardingPassed()) {
      route = Routes.onBoard;
    }

    await AppRouter.navigatorKey.currentState?.pushReplacementNamed(
      route,
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => const AnimatedSplashScreen(),
        );
      case Routes.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RepaintBoundary(
            child: FadeTransition(
              opacity: animation,
              child: const HomeView(),
            ),
          ),
        );
      case Routes.onBoard:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RepaintBoundary(
            child: FadeTransition(
              opacity: animation,
              child: const OnBoardView(),
            ),
          ),
        );
      case Routes.auth:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RepaintBoundary(
            child: FadeTransition(
              opacity: animation,
              child: const AuthView(),
            ),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
    }
    return null;
  }
}
