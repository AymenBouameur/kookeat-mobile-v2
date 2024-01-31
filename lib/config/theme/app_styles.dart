import 'package:cookeat/config/theme/theme.dart';
import 'package:flutter/material.dart';

/// Class that contains all the different styles of an app
class AppStyles {
  AppStyles._();
  static String primaryFontFamily = 'Poppins';

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
        labelLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline1,
        ),
        bodyLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: FontSizes.headline2,
          color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline3,
          color: AppColors.textColor,
        ),
        displayLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline1,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        displayMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline2,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        displaySmall: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline3,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline4,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline5,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        titleLarge: TextStyle(
          fontFamily: primaryFontFamily,
          fontSize: FontSizes.headline1,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
        bodySmall: TextStyle(
          fontFamily: primaryFontFamily,
          color: AppColors.textColor,
          fontSize: FontSizes.headline2,
        ),
      );

  ///app bar theme
  static AppBarTheme get getAppBarTheme => AppBarTheme(
        elevation: 0,
        titleTextStyle: customTextTheme.bodyLarge!.copyWith(
          fontFamily: primaryFontFamily,
          color: Colors.white,
          fontSize: FontSizes.headline5,
        ),
        iconTheme: IconThemeData(color: AppColors.appBarIconsColor),
        backgroundColor: AppColors.appBarColor,
      );

  static TextStyle get elevatedButtonTextStyleDark {
    return TextStyle(
      fontFamily: primaryFontFamily,
      fontSize: FontSizes.headline3,
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
          color: AppColors.accentColor,
        ),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardColor,
      prefixIconColor: AppColors.iconColor,
      suffixIconColor: AppColors.iconColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      border: border(),
      focusedBorder: border(),
      enabledBorder: border(),
      errorBorder: border(),
      focusedErrorBorder: border(),
      disabledBorder: border(),
      errorStyle: const TextStyle(
        fontSize: FontSizes.headline6,
      ),
      hintStyle: TextStyle(
        fontFamily: primaryFontFamily,
        color: AppColors.textColor.withOpacity(0.5),
        fontSize: FontSizes.headline3,
      ),
    );
  }
}
