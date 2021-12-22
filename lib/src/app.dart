import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/home_screen.dart';
import 'settings/settings.controller.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.settingsController}) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: settingsController,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: settingsController.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme(context),
          home: HomeScreen(settingsController: settingsController),
        ),
      );
}
