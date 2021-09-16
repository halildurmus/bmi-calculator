import 'dart:io';

import 'package:bmi_calculator/src/settings/settings.service.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

/// A fake [SettingsService] implementation that used in testing.
class FakeSettingsService implements SettingsService {
  @override
  SharedPreferences get prefs => throw UnimplementedError();

  @override
  Future<Locale> locale() async {
    final String languageCode = Platform.localeName.split('_')[0];
    final Locale locale = Locale(languageCode);

    return Future<Locale>.value(locale);
  }

  @override
  Future<void> updateLocale(Locale locale) async {}
}
