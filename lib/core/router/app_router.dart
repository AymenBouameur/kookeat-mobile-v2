import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/auth/complete_profile/view/complete_profile_view.dart';
import 'package:cookeat/modules/auth/forgot_password/view/forgot_password_view.dart';
import 'package:cookeat/modules/auth/sign_up/sign_up.dart';
import 'package:cookeat/modules/auth/view/auth_view.dart';
import 'package:cookeat/modules/onboard/view/on_board_view.dart';
import 'package:cookeat/modules/profile/view/cookeat_settings_view.dart';
import 'package:cookeat/modules/profile/view/favorites_view.dart';
import 'package:cookeat/modules/profile/view/orders_view.dart';
import 'package:cookeat/modules/profile/view/profile_settings_view.dart';
import 'package:cookeat/modules/root/view/root_view.dart';
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
    } else if (!SharedPref.getIsProfileComplete()) {
      route = Routes.completeProfile;
    } else if (SharedPref.getIsUserLoggedIn()) {
      route = Routes.home;
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
              child: const RootView(),
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
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.completeProfile:
        return MaterialPageRoute(
          builder: (_) => const CompleteProfileView(),
        );
      case Routes.profileSettings:
        return MaterialPageRoute(
          builder: (_) => const ProfileSettingsView(),
        );
      case Routes.cookeatSettings:
        return MaterialPageRoute(
          builder: (_) => const CookeatSettingsView(),
        );
      case Routes.profileOrders:
        return MaterialPageRoute(
          builder: (_) => const OrdersView(),
        );
      case Routes.profileFavorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesView(),
        );
    }
    return null;
  }
}
