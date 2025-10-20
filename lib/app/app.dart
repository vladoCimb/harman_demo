import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/repositories/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:harman_demo/presentation/feed/view/feed_screen.dart';

import 'package:harman_demo/l10n/app_localizations.dart';
import 'package:harman_demo/locale_control/locale_control_bloc/locale_control_bloc.dart';
import 'package:harman_demo/theme_selector/bloc/theme_mode_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => FeedRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LocaleControlBloc()),
          BlocProvider(create: (_) => ThemeModeBloc()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.watch<ThemeModeBloc>().state,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      locale: context.watch<LocaleControlBloc>().state,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: FeedScreen(),
    );
  }
}
