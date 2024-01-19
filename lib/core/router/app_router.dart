import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Widget initialRoutePage() {
    //
    return const HomeView();
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => initialRoutePage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
    }
    return null;
  }
}
