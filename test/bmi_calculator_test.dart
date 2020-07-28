import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmicalculator/utils/bmi_calculator.dart';

void main() {
  test('BMI should be properly calculated with passed arguments', () {
    // Testing BMI for the normal weight.
    int _height = 182;
    int _weight = 76;

    BmiCalculator _bmiCalculator =
        BmiCalculator(height: _height, weight: _weight);
    String _bmiAsString = _bmiCalculator.getBmiAsString;
    String _bmiIntegerPart = _bmiCalculator.getIntegerPart;
    String _bmiDecimalPart = _bmiCalculator.getDecimalPart;
    Color _bmiInterpretationColor = _bmiCalculator.getInterpretationColor;

    expect(_bmiAsString, '22.94');
    expect(_bmiIntegerPart, '22');
    expect(_bmiDecimalPart, '.9');
    expect(_bmiInterpretationColor, const Color(0xFF66BB6A));

    // Testing BMI for the underweight.
    _height = 170;
    _weight = 50;

    _bmiCalculator = BmiCalculator(height: _height, weight: _weight);
    _bmiAsString = _bmiCalculator.getBmiAsString;
    _bmiIntegerPart = _bmiCalculator.getIntegerPart;
    _bmiDecimalPart = _bmiCalculator.getDecimalPart;
    _bmiInterpretationColor = _bmiCalculator.getInterpretationColor;

    expect(_bmiAsString, '17.30');
    expect(_bmiIntegerPart, '17');
    expect(_bmiDecimalPart, '.3');
    expect(_bmiInterpretationColor, Colors.orange);

    // Testing BMI for the overweight.
    _height = 170;
    _weight = 75;

    _bmiCalculator = BmiCalculator(height: _height, weight: _weight);
    _bmiAsString = _bmiCalculator.getBmiAsString;
    _bmiIntegerPart = _bmiCalculator.getIntegerPart;
    _bmiDecimalPart = _bmiCalculator.getDecimalPart;
    _bmiInterpretationColor = _bmiCalculator.getInterpretationColor;

    expect(_bmiAsString, '25.95');
    expect(_bmiIntegerPart, '25');
    expect(_bmiDecimalPart, '.9');
    expect(_bmiInterpretationColor, Colors.red);
  });
}
