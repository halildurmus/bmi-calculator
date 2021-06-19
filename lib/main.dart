import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/impl/settings.controller.impl.dart';
import 'src/settings/impl/settings.service.impl.dart';
import 'src/settings/settings.controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes a new SharedPreferences instance.
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Sets up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final SettingsController settingsController =
      SettingsControllerImpl(SettingsServiceImpl(prefs));

  // Loads the user's preferred settings while the splash screen is displayed.
  await settingsController.loadSettings();

  // Runs the app and pass in the SettingsController.
  runApp(MyApp(settingsController: settingsController));
}
