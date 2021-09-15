import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/home_screen.dart';
import 'l10n/app_localizations.dart';
import 'l10n/locales.dart';
import 'settings/settings.controller.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.settingsController}) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: settingsController.locale,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            MyLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.title,
          supportedLocales: kSupportedLocales,
          theme: lightTheme(context),
          home: HomeScreen(settingsController: settingsController),
        );
      },
    );
  }
}
