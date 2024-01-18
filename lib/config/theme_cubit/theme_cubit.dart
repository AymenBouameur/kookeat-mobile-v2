import 'package:bloc/bloc.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(SharedPref.getTheme());

  void changeTheme() {
    final theme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    // Save in locale storage
    SharedPref.setTheme(theme: theme);

    emit(theme);
  }
}
