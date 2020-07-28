import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
// This file was generated in two steps, using the Dart intl tools. With the
// app's root directory (the one that contains pubspec.yaml) as the current
// directory:
//
// flutter pub get
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/my_localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/my_localizations.dart lib/l10n/intl_en.arb lib/l10n/intl_tr.arb
//
// The second command generates intl_messages.arb and the third generates
// messages_all.dart. There's more about this process in
// https://pub.dev/packages/intl.
import 'package:bmicalculator/l10n/messages_all.dart';

class MyLocalizations {
  MyLocalizations(this.localeName);

  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return MyLocalizations(localeName);
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'BMI Calculator',
      name: 'title',
      desc: 'Title for the app',
      locale: localeName,
    );
  }

  String get gender {
    return Intl.message(
      'GENDER',
      name: 'gender',
      desc: '',
      locale: localeName,
    );
  }

  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      locale: localeName,
    );
  }

  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      locale: localeName,
    );
  }

  String get height {
    return Intl.message(
      'HEIGHT',
      name: 'height',
      desc: '',
      locale: localeName,
    );
  }

  String get weight {
    return Intl.message(
      'WEIGHT',
      name: 'weight',
      desc: '',
      locale: localeName,
    );
  }

  String get bmiInfoFirst {
    return Intl.message(
      'Body mass index, or BMI, is used to determine whether\n you are in a healthy weight range for your height.',
      name: 'bmiInfoFirst',
      desc: '',
      locale: localeName,
    );
  }

  String get bmiInfoSecond {
    return Intl.message(
      "\n* This calculator shouldn't be used for pregnant women or children.",
      name: 'bmiInfoSecond',
      desc: '',
      locale: localeName,
    );
  }

  String get yourBmi {
    return Intl.message(
      'YOUR BMI',
      name: 'yourBmi',
      desc: '',
      locale: localeName,
    );
  }

  String get theBmiChart {
    return Intl.message(
      'The BMI Chart',
      name: 'theBmiChart',
      desc: '',
      locale: localeName,
    );
  }

  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      locale: localeName,
    );
  }

  String get bmiInterpretationOverweight {
    return Intl.message(
      'You have a higher than normal body weight. Try to exercise more.',
      name: 'bmiInterpretationOverweight',
      desc: '',
      locale: localeName,
    );
  }

  String get bmiInterpretationNormal {
    return Intl.message(
      'You have a normal body weight. Great job!',
      name: 'bmiInterpretationNormal',
      desc: '',
      locale: localeName,
    );
  }

  String get bmiInterpretationUnderweight {
    return Intl.message(
      'You have a lower than normal body weight. You can eat a bit more.',
      name: 'bmiInterpretationUnderweight',
      desc: '',
      locale: localeName,
    );
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
