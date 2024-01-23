import 'package:cookeat/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  ///
  static void showSnackBar({required String text, bool isError = false}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: isError ? Colors.redAccent : AppColors.accentColor,
      ),
    );
  }
}
