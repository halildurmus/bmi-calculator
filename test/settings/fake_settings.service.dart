import 'dart:io';

import 'package:bmicalculator/src/settings/settings.service.dart';

/// A fake [SettingsService] implementation that used in testing.
class FakeSettingsService implements SettingsService {
  @override
  Future<String> language() async {
    return Future<String>.value(Platform.localeName);
  }

  @override
  Future<void> updateLanguage(String language) async {}
}
