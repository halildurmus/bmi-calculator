import 'dart:io';

import 'package:bmicalculator/src/settings/settings_service.dart';
import 'package:flutter/material.dart' show Locale;

/// A fake [SettingsService] implementation that used in testing.
class FakeSettingsService implements SettingsService {
  @override
  Future<Locale> locale() async {
    final String language = Platform.localeName.replaceFirst('_', '-');
    final Locale locale = Locale.fromSubtags(
      languageCode: language.split('-')[0],
      countryCode: language.split('-')[1],
    );

    return Future<Locale>.value(locale);
  }

  @override
  Future<void> updateLocale(Locale locale) async {}
}
