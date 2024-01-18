import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/config/theme/app_theme.dart';
import 'package:cookeat/config/theme_cubit/theme_cubit.dart';
import 'package:cookeat/core/router/app_router.dart';
import 'package:cookeat/l10n/l10n.dart';
import 'package:cookeat/l10n/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: Builder(
        builder: (context) {
          final themeState = context.select(
            (ThemeCubit themeCubit) => themeCubit.state,
          );
          final localeState = context.select(
            (LocaleCubit localeCubit) => localeCubit.state,
          );

          return MaterialApp(
            title: 'Cookeat',
            debugShowCheckedModeBanner: false,
            locale: localeState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: AppRouter.onGenerateRoute,
            theme:
                themeState == ThemeMode.light ? AppTheme.light : AppTheme.dark,
            themeMode: themeState,
            color: AppColors.primaryColor,
            themeAnimationCurve: Curves.easeOutQuart,
            themeAnimationDuration: const Duration(milliseconds: 300),
          );
        },
      ),
    );
  }
}
