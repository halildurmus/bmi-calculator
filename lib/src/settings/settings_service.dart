import 'package:flutter/material.dart' show Locale;

/// An abstract class used for storing and retrieving user settings.
abstract class SettingsService {
  /// Loads the user's preferred [Locale].
  Future<Locale> locale();

  /// Persists the user's preferred locale to local storage.
  Future<void> updateLocale(Locale locale);
}
