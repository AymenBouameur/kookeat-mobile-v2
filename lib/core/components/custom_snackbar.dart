import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/config/theme/app_font_sizes.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  ///
  static void showSnackBar({required String text, bool isError = false}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: CustomText(
          text,
          textColor: AppColors.scaffoldBackgroundColor,
          fontsize: FontSizes.headline5,
        ),
        backgroundColor: isError ? Colors.redAccent : AppColors.accentColor,
      ),
    );
  }
}
