import 'package:flutter/material.dart';

/// An abstract class that many Widgets can interact with to read user settings,
/// update user settings, or listen to user settings changes.
abstract class SettingsController with ChangeNotifier {
  /// Returns the user's preferred language.
  String get language;

  /// Loads the user's settings.
  Future<void> loadSettings();

  /// Updates and persists the language based on the user's selection.
  Future<void> updateLanguage(String? newLanguage);
}
