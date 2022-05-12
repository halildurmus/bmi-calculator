import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show Locale, WidgetsBinding;
import 'package:shared_preferences/shared_preferences.dart';

/// A service used for storing and retrieving user settings.
///
/// This service persist the user settings locally, using the
/// [shared_preferences] package.
class SettingsService {
  SettingsService(this._prefs);

  final SharedPreferences _prefs;
  static const String _languageKey = 'app-language';

  String _getSystemLanguageCode() => kIsWeb
      ? WidgetsBinding.instance.window.locale.languageCode.split('_')[0]
      : Platform.localeName.split('_')[0];

  /// Loads the user's preferred language from [SharedPreferences].
  ///
  /// If the preferred language is not found then the system locale is used.
  Future<Locale> locale() async {
    final languageCode =
        _prefs.getString(_languageKey) ?? _getSystemLanguageCode();

    return Locale(languageCode);
  }

  /// Persists the user's preferred language to local storage.
  Future<void> updateLocale(Locale language) async =>
      _prefs.setString(_languageKey, language.toLanguageTag());
}
