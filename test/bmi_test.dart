import 'package:bmi_calculator/src/home/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BMI should be properly calculated with passed arguments', () {
    // Testing BMI for the normal weight.
    var height = 182;
    var weight = 76;

    var bmi = Bmi(height: height, weight: weight);
    var bmiAsString = bmi.bmiAsString;
    var bmiIntegerPart = bmi.wholeNumber;
    var bmiDecimalPart = bmi.decimalPart;
    var bmiInterpretationColor = bmi.interpretationColor;

    expect(bmiAsString, '22.94');
    expect(bmiIntegerPart, '22');
    expect(bmiDecimalPart, '.9');
    expect(bmiInterpretationColor, const Color(0xFF66BB6A));

    // Testing BMI for the underweight.
    height = 170;
    weight = 50;

    bmi = Bmi(height: height, weight: weight);
    bmiAsString = bmi.bmiAsString;
    bmiIntegerPart = bmi.wholeNumber;
    bmiDecimalPart = bmi.decimalPart;
    bmiInterpretationColor = bmi.interpretationColor;

    expect(bmiAsString, '17.30');
    expect(bmiIntegerPart, '17');
    expect(bmiDecimalPart, '.3');
    expect(bmiInterpretationColor, Colors.orange);

    // Testing BMI for the overweight.
    height = 170;
    weight = 75;

    bmi = Bmi(height: height, weight: weight);
    bmiAsString = bmi.bmiAsString;
    bmiIntegerPart = bmi.wholeNumber;
    bmiDecimalPart = bmi.decimalPart;
    bmiInterpretationColor = bmi.interpretationColor;

    expect(bmiAsString, '25.95');
    expect(bmiIntegerPart, '25');
    expect(bmiDecimalPart, '.9');
    expect(bmiInterpretationColor, Colors.red);
  });
}
