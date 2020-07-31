import 'package:bmicalculator/my_localizations.dart';
import 'package:flutter/material.dart';

import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/home/bmi_chart.dart';
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
        left: 24.0,
        right: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                MyLocalizations.of(context).yourBmi,
                style: TextStyle(
                  color: Colors.black.withOpacity(.55),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GestureDetector(
                key: const ValueKey<String>('BmiChartButton'),
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => BmiChart(),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      MyLocalizations.of(context).theBmiChart,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.expand_less,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                bmiResult.getIntegerPart,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 48.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  bmiResult.getDecimalPart,
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
            height: 35.0,
            child: Center(
              child: Text(
                bmiResult.getInterpretation(context),
                key: const ValueKey<String>('BmiInterpretationText'),
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
