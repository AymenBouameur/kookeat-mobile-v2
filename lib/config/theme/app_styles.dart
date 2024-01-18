import 'package:cookeat/config/theme/theme.dart';
import 'package:flutter/material.dart';

/// Class that contains all the different styles of an app
class AppStyles {
  AppStyles._();

  /// Border radius
  static BorderRadius get borderRadius => BorderRadius.circular(15);

  /// Custom page transitions
  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
  static TextTheme get customTextTheme => TextTheme(
        labelLarge: const TextStyle(
          fontSize: FontSizes.headline6,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: FontSizes.subtitle1,
          color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
          fontSize: FontSizes.subtitle2,
          color: AppColors.textColor,
        ),
        displayLarge: TextStyle(
          fontSize: FontSizes.headline1,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        displayMedium: TextStyle(
          fontSize: FontSizes.headline2,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        displaySmall: TextStyle(
          fontSize: FontSizes.headline3,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        headlineMedium: TextStyle(
          fontSize: FontSizes.headline4,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        headlineSmall: TextStyle(
          fontSize: FontSizes.headline5,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        titleLarge: TextStyle(
          fontSize: FontSizes.headline6,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        bodySmall: TextStyle(
          color: AppColors.textColor,
          fontSize: FontSizes.headline7,
        ),
      );

  ///app bar theme
  static AppBarTheme get getAppBarTheme => AppBarTheme(
        elevation: 0,
        titleTextStyle: customTextTheme.bodyLarge!.copyWith(
          color: Colors.white,
          fontSize: FontSizes.headline5,
        ),
        iconTheme: IconThemeData(color: AppColors.appBarIconsColor),
        backgroundColor: AppColors.appBarColor,
      );

  static TextStyle get elevatedButtonTextStyleDark {
    return TextStyle(
      fontSize: FontSizes.headline7,
      color: AppColors.textColor,
    );
  }

  static ElevatedButtonThemeData get customElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.accentColor,
        backgroundColor: AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: elevatedButtonTextStyleDark,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  static InputDecorationTheme get customInputDecorationTheme {
    OutlineInputBorder border() {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppColors.dividerColor,
        ),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardColor,
      prefixIconColor: AppColors.iconColor,
      suffixIconColor: AppColors.iconColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      border: border(),
      focusedBorder: border(),
      enabledBorder: border(),
      errorBorder: border(),
      focusedErrorBorder: border(),
      disabledBorder: border(),
      hintStyle: TextStyle(
        color: AppColors.textColor.withOpacity(0.5),
        fontSize: FontSizes.headline7,
      ),
    );
  }
}
