import 'dart:io';

import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_service.dart';

/// A service that stores and retrieves user settings.
///
/// This class persist the user settings locally, using the
/// [shared_preferences] package.
class SettingsServiceImpl implements SettingsService {
  SettingsServiceImpl(this.prefs);

  final SharedPreferences prefs;
  static const String _languageKey = 'language';

  /// Loads the user's preferred language from [SharedPreferences].
  ///
  /// If the preferred language is not found then [Platform.localeName] is used.
  @override
  Future<Locale> locale() async {
    final String language = prefs.getString(_languageKey) ??
        Platform.localeName.replaceFirst('_', '-');
    final Locale locale = Locale.fromSubtags(
      languageCode: language.split('-')[0],
      countryCode: language.split('-')[1],
    );

    return locale;
  }

  /// Persists the user's preferred language to local storage.
  @override
  Future<void> updateLocale(Locale language) async {
    prefs.setString(_languageKey, language.toLanguageTag());
  }
}
