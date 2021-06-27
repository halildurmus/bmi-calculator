import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';
import 'constants.dart';
import 'home/home_screen.dart';
import 'settings/settings_controller.dart';

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
          supportedLocales: const <Locale>[
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          theme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
            ),
            primaryColor: kPrimaryColor,
            iconTheme: IconTheme.of(context).copyWith(color: kPrimaryColor),
            primarySwatch: Colors.red,
          ),
          home: HomeScreen(settingsController: settingsController),
        );
      },
    );
  }
}
