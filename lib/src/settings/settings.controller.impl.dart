import 'package:flutter/material.dart' show ChangeNotifier, Locale;

import 'settings_controller.dart';
import 'settings_service.dart';

/// An implementation of the [SettingsController] that many Widgets
/// can interact with to read user settings, update user settings,
/// or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets.
/// The [SettingsControllerImpl] uses the [SettingsService] to store
/// and retrieve user settings.
class SettingsControllerImpl with ChangeNotifier implements SettingsController {
  SettingsControllerImpl(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make locale a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late Locale _locale;

  // Allow Widgets to read the user's preferred locale.
  @override
  Locale get locale => _locale;

  /// Load the user's settings from the [SettingsService]. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  @override
  Future<void> loadSettings() async {
    _locale = await _settingsService.locale();

    // Informs listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the locale based on the user's selection.
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
