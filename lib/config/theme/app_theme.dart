import 'package:cookeat/config/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  /// Light style
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: LightThemeColors.primaryColor,
      scaffoldBackgroundColor: LightThemeColors.backgroundColor,
      dividerColor: LightThemeColors.dividerColor,
      cardColor: LightThemeColors.cardColor,
      hintColor: LightThemeColors.bodyTextColor.withOpacity(0.5),
      pageTransitionsTheme: AppStyles.pageTransitionsTheme,
      inputDecorationTheme: AppStyles.customInputDecorationTheme,
      elevatedButtonTheme: AppStyles.customElevatedButtonTheme,
      textTheme: AppStyles.customTextTheme,
      primaryTextTheme: AppStyles.customTextTheme,
      iconTheme: const IconThemeData(
        color: LightThemeColors.iconColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: LightThemeColors.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: LightThemeColors.backgroundColor,
        shape: CircularNotchedRectangle(),
        surfaceTintColor: Colors.transparent,
        elevation: 3,
      ),
      primaryColorLight: LightThemeColors.primaryColor,
      primaryColorDark: LightThemeColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        primary: LightThemeColors.primaryColor,
        secondary: LightThemeColors.accentColor,
        seedColor: LightThemeColors.accentColor,
      ),
    );
  }

  /// Dark style
  static ThemeData get dark {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: DarkThemeColors.primaryColor,
      canvasColor: DarkThemeColors.accentColor,
      scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
      cardColor: DarkThemeColors.cardColor,
      hintColor: DarkThemeColors.bodyTextColor.withOpacity(0.5),
      dividerColor: DarkThemeColors.dividerColor,
      dialogBackgroundColor: DarkThemeColors.backgroundColor,
      pageTransitionsTheme: AppStyles.pageTransitionsTheme,
      inputDecorationTheme: AppStyles.customInputDecorationTheme,
      elevatedButtonTheme: AppStyles.customElevatedButtonTheme,
      textTheme: AppStyles.customTextTheme,
      primaryTextTheme: AppStyles.customTextTheme,
      iconTheme: const IconThemeData(
        color: DarkThemeColors.iconColor,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DarkThemeColors.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: LightThemeColors.backgroundColor,
        shape: CircularNotchedRectangle(),
        surfaceTintColor: Colors.transparent,
        elevation: 3,
      ),
      primaryColorLight: LightThemeColors.primaryColor,
      primaryColorDark: LightThemeColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(
        primary: DarkThemeColors.primaryColor,
        secondary: DarkThemeColors.accentColor,
        seedColor: DarkThemeColors.accentColor,
      ),
    );
  }
}
