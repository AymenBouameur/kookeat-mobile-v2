import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final _isLightTheme = SharedPref.getTheme() == ThemeMode.light;
  //
  static Color primaryColor = _isLightTheme
      ? LightThemeColors.primaryColor
      : DarkThemeColors.primaryColor;
  static Color accentColor = _isLightTheme
      ? LightThemeColors.accentColor
      : DarkThemeColors.accentColor;

  //APPBAR
  static Color appBarColor = _isLightTheme
      ? LightThemeColors.appBarColor
      : DarkThemeColors.appBarColor;

  //SCAFFOLD
  static Color scaffoldBackgroundColor = _isLightTheme
      ? LightThemeColors.scaffoldBackgroundColor
      : DarkThemeColors.scaffoldBackgroundColor;
  static Color backgroundColor = _isLightTheme
      ? LightThemeColors.backgroundColor
      : DarkThemeColors.backgroundColor;
  static Color dividerColor = _isLightTheme
      ? LightThemeColors.dividerColor
      : DarkThemeColors.dividerColor;
  static Color cardColor =
      _isLightTheme ? LightThemeColors.cardColor : DarkThemeColors.cardColor;

  //ICONS
  static Color appBarIconsColor = _isLightTheme
      ? LightThemeColors.appBarIconsColor
      : DarkThemeColors.appBarIconsColor;
  static Color iconColor =
      _isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor;

  //BUTTON
  static Color get buttonColor => _isLightTheme
      ? LightThemeColors.buttonColor
      : DarkThemeColors.buttonColor;
  static Color buttonTextColor = _isLightTheme
      ? LightThemeColors.buttonTextColor
      : DarkThemeColors.buttonTextColor;
  static Color buttonDisabledColor = _isLightTheme
      ? LightThemeColors.buttonDisabledColor
      : DarkThemeColors.buttonDisabledColor;
  static Color buttonDisabledTextColor = _isLightTheme
      ? LightThemeColors.buttonDisabledTextColor
      : DarkThemeColors.buttonDisabledTextColor;

  //TEXT
  static Color textColor = _isLightTheme
      ? LightThemeColors.bodyTextColor
      : DarkThemeColors.bodyTextColor;

  // progress bar indicator
  static Color progressIndicatorColor = _isLightTheme
      ? LightThemeColors.progressIndicatorColor
      : DarkThemeColors.progressIndicatorColor;
}
