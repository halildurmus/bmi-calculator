import 'dart:io';

import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

import 'locales.dart' as locales;
import 'settings_service.dart';

/// An implementation of the [SettingsService] used for storing and retrieving
/// user settings.
///
/// This implementation persist the user settings locally, using the
/// [shared_preferences] package.
class SettingsServiceImpl implements SettingsService {
  SettingsServiceImpl(this.prefs);

  final SharedPreferences prefs;
  static const String _languageKey = 'app-language';

  /// Loads the user's preferred language from [SharedPreferences].
  ///
  /// If the preferred language is not found then [Platform.localeName] is used.
  @override
  Future<Locale> locale() async {
    final String languageTag = prefs.getString(_languageKey) ??
        Platform.localeName.replaceFirst('_', '-');

    return locales.getLocale(languageTag);
  }

  /// Persists the user's preferred language to local storage.
  @override
  Future<void> updateLocale(Locale language) async {
    prefs.setString(_languageKey, language.toLanguageTag());
  }
}
