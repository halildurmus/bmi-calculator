import 'dart:io';

import 'package:bmi_calculator/src/settings/settings.service.dart';
import 'package:flutter/material.dart' show Locale;

/// A fake [SettingsService] implementation that used in testing.
class FakeSettingsService implements SettingsService {

  @override
  Future<Locale> locale() async {
    final String languageCode = Platform.localeName.split('_')[0];
    final Locale locale = Locale(languageCode);

    return Future<Locale>.value(locale);
  }

  @override
  Future<void> updateLocale(Locale locale) async {}
}
