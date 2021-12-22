import 'package:bmi_calculator/src/home/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BMI should be properly calculated with passed arguments', () {
    // Testing BMI for the normal weight.
    var _height = 182;
    var _weight = 76;

    var _bmi = Bmi(height: _height, weight: _weight);
    var _bmiAsString = _bmi.bmiAsString;
    var _bmiIntegerPart = _bmi.wholeNumber;
    var _bmiDecimalPart = _bmi.decimalPart;
    var _bmiInterpretationColor = _bmi.interpretationColor;

    expect(_bmiAsString, '22.94');
    expect(_bmiIntegerPart, '22');
    expect(_bmiDecimalPart, '.9');
    expect(_bmiInterpretationColor, const Color(0xFF66BB6A));

    // Testing BMI for the underweight.
    _height = 170;
    _weight = 50;

    _bmi = Bmi(height: _height, weight: _weight);
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

    _bmi = Bmi(height: _height, weight: _weight);
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
