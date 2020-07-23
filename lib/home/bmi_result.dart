
import 'package:flutter/material.dart';

import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/utils/bmi_calculator.dart';

class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({this.bmiResult});

  final BmiCalculator bmiResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 135.0,
        bottom: 0.0,
        left: 24,
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'YOUR BMI',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.55),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'The BMI Tables',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(
                          Icons.expand_less,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                bmiResult.getDecimal,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 48.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  bmiResult.getDigit,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 40.0,
            child: Center(
              child: Text(
                bmiResult.getInterpretation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: bmiResult.getInterpretationColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
