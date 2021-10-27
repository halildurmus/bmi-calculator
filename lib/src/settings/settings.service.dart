import 'dart:io';

import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

/// A service used for storing and retrieving user settings.
///
/// This service persist the user settings locally, using the
/// [shared_preferences] package.
class SettingsService {
  SettingsService(this._prefs);

  final SharedPreferences _prefs;
  static const String _languageKey = 'app-language';

  /// Loads the user's preferred language from [SharedPreferences].
  ///
  /// If the preferred language is not found then [Platform.localeName] is used.
  Future<Locale> locale() async {
    final String languageTag =
        _prefs.getString(_languageKey) ?? Platform.localeName.split('_')[0];

    return Locale(languageTag);
  }

  /// Persists the user's preferred language to local storage.
  Future<void> updateLocale(Locale language) async {
    _prefs.setString(_languageKey, language.toLanguageTag());
  }
}
