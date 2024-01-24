import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // prevent making instance
  SharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _onBoardPassed = 'on_boarding_passed';
  static const String _completeProfile = 'complete_profile';
  static const String _loggedIn = 'is_logged_in';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// set theme current type as light theme
  static Future<void> setTheme({required ThemeMode theme}) {
    final t = theme == ThemeMode.dark ? 'dark' : 'light';
    return _sharedPreferences.setString(_lightThemeKey, t);
  }

  /// get if the current theme type is light
  static ThemeMode getTheme() =>
      (_sharedPreferences.getString(_lightThemeKey) ?? 'system') == 'dark'
          ? ThemeMode.dark
          : ThemeMode.light;

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    final langCode = _sharedPreferences.getString(_currentLocalKey);
    return Locale(langCode ?? 'en'); // Default lang.
  }

  /// set user is logged in
  static Future<bool> setIsUserLoggedIn({required bool isloggedin}) =>
      _sharedPreferences.setBool(_loggedIn, isloggedin);

  /// set user is logged in
  static bool getIsUserLoggedIn() =>
      _sharedPreferences.getBool(_loggedIn) ?? false;

  /// set On Boarding Passed
  static Future<bool> setOnBoardingPassed({required bool isPassed}) =>
      _sharedPreferences.setBool(_onBoardPassed, isPassed);

  /// get On Boarding Passed
  static bool getOnBoardingPassed() =>
      _sharedPreferences.getBool(_onBoardPassed) ?? false;

  /// set Complete Profile
  static Future<bool> setCompleteProfile({required bool completeProfile}) =>
      _sharedPreferences.setBool(_completeProfile, completeProfile);

  /// get Complete Profile
  static bool getCompleteProfile() =>
      _sharedPreferences.getBool(_completeProfile) ?? false;

  /// clear all data from shared pref
  static Future<void> clear() async => _sharedPreferences.clear();
}
