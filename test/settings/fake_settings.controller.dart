import 'package:bmi_calculator/src/settings/settings.controller.dart';
import 'package:bmi_calculator/src/settings/settings.service.dart';
import 'package:flutter/material.dart';

/// A fake [SettingsController] implementation that used in testing.
class FakeSettingsController with ChangeNotifier implements SettingsController {
  FakeSettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make locale a private variable so it is not updated directly.
  late Locale _locale;

  // Allow Widgets to read the user's preferred locale.
  @override
  Locale get locale => _locale;

  /// Loads the user's settings from the SettingsService.
  @override
  Future<void> loadSettings() async {
    _locale = await _settingsService.locale();

    // Informs listeners a change has occurred.
    notifyListeners();
  }

  /// Updates the locale based on the user's selection.
  @override
  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == null) {
      return;
    }

    // Dot not perform any work if new and old locale are identical
    if (newLocale == _locale) {
      return;
    }

    // Otherwise, store the new locale in memory
    _locale = newLocale;

    // Informs listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database using the SettingService.
    await _settingsService.updateLocale(newLocale);
  }
}
