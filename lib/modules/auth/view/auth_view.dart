import 'package:cookeat/modules/auth/bloc/auth_bloc.dart';
import 'package:cookeat/modules/auth/sign_in/sign_in.dart';
import 'package:cookeat/modules/auth/view/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => AuthBloc(),
                child: const RegistrationView(),
              ),
              const SignInView(),
            ],
          ),
        ),
      ),
    );
  }
}
