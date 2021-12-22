import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/settings.controller.dart';
import 'src/settings/settings.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes a new SharedPreferences instance.
  final prefs = await SharedPreferences.getInstance();

  // Sets up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService(prefs));

  // Loads the user's preferred settings while the splash screen is displayed.
  await settingsController.loadSettings();

  // Runs the app and pass in the SettingsController.
  runApp(
    ProviderScope(
      child: MyApp(settingsController: settingsController),
    ),
  );
}
