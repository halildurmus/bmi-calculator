import 'package:bmicalculator/src/settings/settings.controller.dart';
import 'package:bmicalculator/src/settings/settings.service.dart';
import 'package:flutter/material.dart';

/// A fake [SettingsController] implementation that used in testing.
class FakeSettingsController with ChangeNotifier implements SettingsController {
  FakeSettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make language a private variable so it is not updated directly.
  late String _language;

  // Allow Widgets to read the user's preferred language.
  @override
  String get language => _language;

  /// Loads the user's settings from the SettingsService.
  @override
  Future<void> loadSettings() async {
    _language = await _settingsService.language();

    // Informs listeners a change has occurred.
    notifyListeners();
  }

  /// Updates the language based on the user's selection.
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
