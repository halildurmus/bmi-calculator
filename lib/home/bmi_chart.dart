import 'dart:ui' show ImageFilter;

import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/my_localizations.dart';
import 'package:flutter/material.dart';

class BmiChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: Container(
          height: 400.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'BMI Chart',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset('assets/images/bmi-chart.png'),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  textColor: kPrimaryColor,
                  child: Text(
                    MyLocalizations.of(context).close,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
