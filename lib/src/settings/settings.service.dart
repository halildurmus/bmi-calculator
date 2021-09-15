import 'dart:io';

import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/locales.dart';

/// A service used for storing and retrieving user settings.
///
/// This service persist the user settings locally, using the
/// [shared_preferences] package.
class SettingsService {
  SettingsService(this.prefs);

  final SharedPreferences prefs;
  static const String _languageKey = 'app-language';

  /// Loads the user's preferred language from [SharedPreferences].
  ///
  /// If the preferred language is not found then [Platform.localeName] is used.
  Future<Locale> locale() async {
    final String languageTag = prefs.getString(_languageKey) ??
        Platform.localeName.replaceFirst('_', '-');

    return getLocaleFromString(languageTag);
  }

  /// Persists the user's preferred language to local storage.
  Future<void> updateLocale(Locale language) async {
    prefs.setString(_languageKey, language.toLanguageTag());
  }
}
