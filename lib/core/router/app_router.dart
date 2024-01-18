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
      case Paths.initial:
        return MaterialPageRoute(
          builder: (_) => initialRoutePage(),
        );
      case Paths.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
    }
    return null;
  }
}

abstract class Paths {
  Paths._();
  static const initial = '/';
  static const home = '/home';
  static const auth = '/auth';
}
