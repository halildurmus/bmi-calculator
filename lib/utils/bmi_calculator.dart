import 'dart:math';

import 'package:bmicalculator/my_localizations.dart';
import 'package:flutter/material.dart';

class BmiCalculator {
  /// Calculates the BMI with given parameters named [height] and [weight].
  /// The formula used in calculating BMI is using the Metric units.
  /// So, the [height] must be in cm and the [weight] must be in kg.
  BmiCalculator({this.height, this.weight}) {
    // The BMI formula for the Metric system.
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  double _bmi;

  /// Returns the calculated BMI. e.g. 22.944088878154812.
  double get getBmi => _bmi;

  /// Returns the BMI as [String] with only 2 digits after [Decimal] point.
  /// e.g. '22.94'.
  String get getBmiAsString => getBmi.toStringAsFixed(2);

  /// Returns [Integer] part of the BMI. e.g. If the BMI is '22.94'
  /// then returns '22'.
  String get getIntegerPart => getBmi.floor().toString();

  /// Returns [Decimal] part of the BMI. e.g. If the BMI is '22.94'
  /// then returns '.9'.
  String get getDecimalPart {
    final int indexOfDecimal = getBmiAsString.indexOf('.');
    // Removes the Integer part in the String. e.g. '22.94' becomes '.94'.
    final String stringWithoutDecimal =
        getBmiAsString.substring(indexOfDecimal);
    // Removes the last character in the String. e.g. '.94' becomes '.9'.
    final String stringWithoutLastDigit =
        stringWithoutDecimal.substring(0, stringWithoutDecimal.length - 1);
    return stringWithoutLastDigit;
  }

  /// Returns interpretation text based on the calculated BMI.
  String getInterpretation(BuildContext context) {
    if (getBmi >= 25) {
      return MyLocalizations.of(context).bmiInterpretationOverweight;
    } else if (getBmi >= 18.5) {
      return MyLocalizations.of(context).bmiInterpretationNormal;
    } else {
      return MyLocalizations.of(context).bmiInterpretationUnderweight;
    }
  }

  /// Returns interpretation text [Color] based on the calculated BMI.
  Color get getInterpretationColor {
    if (getBmi >= 25) {
      return Colors.red;
    } else if (getBmi > 18.5) {
      return const Color(0xFF66BB6A);
    } else {
      return Colors.orange;
    }
  }
}
