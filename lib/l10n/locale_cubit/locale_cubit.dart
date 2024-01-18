// locale_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  const LocaleState(this.locale);
  final Locale locale;

  @override
  List<Object?> get props => [locale];
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(
          LocaleState(Locale(SharedPref.getCurrentLocal().languageCode)),
        );

  void changeLocale(Locale newLocale) {
    // Save in locale storage
    SharedPref.setCurrentLanguage(newLocale.languageCode);
    //
    emit(LocaleState(newLocale));
  }
}
