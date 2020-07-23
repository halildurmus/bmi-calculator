import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BmiCalculator {
  BmiCalculator({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);

    stringWithDecimal = _bmi.floor().toString();

    final String doubleAsString = _bmi.toStringAsFixed(2);
    final int indexOfDecimal = doubleAsString.indexOf('.');
    final String stringWithoutDecimal =
        doubleAsString.substring(indexOfDecimal);
    stringWithoutLastDigit =
        stringWithoutDecimal.substring(0, stringWithoutDecimal.length - 1);
  }

  final int height;
  final int weight;
  double _bmi;
  String stringWithDecimal;
  String stringWithoutLastDigit;

  String get getDecimal => stringWithDecimal;

  String get getDigit => stringWithoutLastDigit;

  Color get getInterpretationColor {
    if (_bmi >= 25) {
      return Colors.red;
    } else if (_bmi > 18.5) {
      return const Color(0xFF66BB6A);
    } else {
      return Colors.orange;
    }
  }

  String get getInterpretation {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Great job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
