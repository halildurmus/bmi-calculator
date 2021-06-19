import 'package:flutter/material.dart';

import '../settings.controller.dart';
import '../settings.service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the [SettingsService] to store and retrieve user settings.
class SettingsControllerImpl with ChangeNotifier implements SettingsController {
  SettingsControllerImpl(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make language a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late String _language;

  // Allow Widgets to read the user's preferred language.
  @override
  String get language => _language;

  /// Loads the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  @override
  Future<void> loadSettings() async {
    _language = await _settingsService.language();

    // Informs listeners a change has occurred.
    notifyListeners();
  }

  /// Updates and persists the language based on the user's selection.
  @override
  Future<void> updateLanguage(String? newLanguage) async {
    if (newLanguage == null) {
      return;
    }

    // Do not perform any work if new and old language are identical.
    if (newLanguage == _language) {
      return;
    }

    // Otherwise, store the new language in memory.
    _language = newLanguage;

    // Informs listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database using the SettingService.
    await _settingsService.updateLanguage(newLanguage);
  }
}
