import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/home/view/home_view.dart';
import 'package:cookeat/modules/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static Widget initialRoutePage() {
    return const AnimatedSplashScreen();
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => initialRoutePage(),
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
    }
    return null;
  }
}
