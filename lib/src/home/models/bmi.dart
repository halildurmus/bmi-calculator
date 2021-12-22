import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';

/// A class that calculates BMI.
class Bmi {
  /// Creates an instance of [Bmi] with given named parameters [height]
  /// and [weight].
  ///
  /// The formula used in calculating BMI is using the `Metric` units.
  /// Therefore, the [height] must be in `centimeters(cm)` and the [weight]
  /// must be in `kilograms(kg)`.
  Bmi({required this.height, required this.weight}) {
    // BMI formula using the Metric system.
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  late double _bmi;

  /// Returns the calculated BMI.
  ///
  /// e.g. 22.944088878154812.
  double get bmi => _bmi;

  /// Returns the BMI as [String] with only 2 digits after [Decimal] point.
  /// e.g. '22.94'.
  String get bmiAsString => bmi.toStringAsFixed(2);

  /// Returns the whole number part of the BMI.
  ///
  /// e.g. If the BMI is '22.94' then returns '22'.
  String get wholeNumber {
    final indexOfDecimalPoint = bmiAsString.indexOf('.');

    return bmiAsString.substring(0, indexOfDecimalPoint);
  }

  /// Returns [Decimal] part of the BMI.
  ///
  /// e.g. If the BMI is '22.94' then returns '.9'.
  String get decimalPart {
    final indexOfDecimalPoint = bmiAsString.indexOf('.');

    return bmiAsString.substring(indexOfDecimalPoint, indexOfDecimalPoint + 2);
  }

  /// Returns interpretation text based on the calculated BMI.
  String getInterpretationText(BuildContext context) {
    if (bmi >= 25) {
      return AppLocalizations.of(context)!.bmiInterpretationOverweight;
    } else if (bmi >= 18.5) {
      return AppLocalizations.of(context)!.bmiInterpretationNormal;
    }

    return AppLocalizations.of(context)!.bmiInterpretationUnderweight;
  }

  /// Returns interpretation text [Color] based on the calculated BMI.
  Color get interpretationColor {
    if (bmi >= 25) {
      return Colors.red;
    } else if (bmi > 18.5) {
      return normalBmiColor;
    }

    return Colors.orange;
  }

  @override
  String toString() => 'Bmi{height: $height, weight: $weight, bmi: $bmi, '
      'bmiAsString: $bmiAsString, wholeNumber: $wholeNumber, '
      'decimalPart: $decimalPart}';
}
