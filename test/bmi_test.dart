import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmicalculator/src/models/bmi.dart';

void main() {
  test('BMI should be properly calculated with passed arguments', () {
    // Testing BMI for the normal weight.
    int _height = 182;
    int _weight = 76;

    BMI _bmi = BMI(height: _height, weight: _weight);
    String _bmiAsString = _bmi.bmiAsString;
    String _bmiIntegerPart = _bmi.wholeNumber;
    String _bmiDecimalPart = _bmi.decimalPart;
    Color _bmiInterpretationColor = _bmi.interpretationColor;

    expect(_bmiAsString, '22.94');
    expect(_bmiIntegerPart, '22');
    expect(_bmiDecimalPart, '.9');
    expect(_bmiInterpretationColor, const Color(0xFF66BB6A));

    // Testing BMI for the underweight.
    _height = 170;
    _weight = 50;

    _bmi = BMI(height: _height, weight: _weight);
    _bmiAsString = _bmi.bmiAsString;
    _bmiIntegerPart = _bmi.wholeNumber;
    _bmiDecimalPart = _bmi.decimalPart;
    _bmiInterpretationColor = _bmi.interpretationColor;

    expect(_bmiAsString, '17.30');
    expect(_bmiIntegerPart, '17');
    expect(_bmiDecimalPart, '.3');
    expect(_bmiInterpretationColor, Colors.orange);

    // Testing BMI for the overweight.
    _height = 170;
    _weight = 75;

    _bmi = BMI(height: _height, weight: _weight);
    _bmiAsString = _bmi.bmiAsString;
    _bmiIntegerPart = _bmi.wholeNumber;
    _bmiDecimalPart = _bmi.decimalPart;
    _bmiInterpretationColor = _bmi.interpretationColor;

    expect(_bmiAsString, '25.95');
    expect(_bmiIntegerPart, '25');
    expect(_bmiDecimalPart, '.9');
    expect(_bmiInterpretationColor, Colors.red);
  });
}
