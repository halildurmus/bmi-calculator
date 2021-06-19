import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../settings.service.dart';

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
  Future<String> language() async {
    return prefs.getString(_languageKey) ?? Platform.localeName;
  }

  /// Persists the user's preferred language to local storage.
  @override
  Future<void> updateLanguage(String language) async {
    prefs.setString(_languageKey, language);
  }
}
