import 'package:cookeat/modules/auth/forgot_password/view/forgot_password_email_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});
  static final pageController = PageController();

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  void dispose() {
    ForgotPasswordView.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: ForgotPasswordView.pageController,
          children: const [
            ForgotPasswordEmailView(),
          ],
        ),
      ),
    );
  }
}
