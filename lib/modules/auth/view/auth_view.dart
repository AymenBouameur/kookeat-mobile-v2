import 'package:cookeat/modules/auth/sign_in/sign_in.dart';
import 'package:cookeat/modules/auth/sign_up/sign_up.dart';
import 'package:cookeat/modules/auth/view/registration_view.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  static final pageController = PageController();
  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  void dispose() {
    AuthView.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PageView(
            controller: AuthView.pageController,
            // physics: const NeverScrollableScrollPhysics(),
            children: const [
              RegistrationView(),
              SignInView(),
              SignUpView(),
            ],
          ),
        ),
      ),
    );
  }
}
