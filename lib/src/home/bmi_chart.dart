import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../app_localizations.dart';

class BmiChart extends StatelessWidget {
  const BmiChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    Widget _buildBmiChartText() {
      return Text(
        AppLocalizations.of(context)!.theBmiChart,
        style: textTheme.headline6!.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Widget _buildCloseButton() {
      return TextButton(
        onPressed: () => Navigator.pop(context),
        style: TextButton.styleFrom(primary: theme.primaryColor),
        child: Text(
          AppLocalizations.of(context)!.close,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildBmiChartText(),
              Image.asset('assets/images/bmi-chart.png'),
              _buildCloseButton(),
            ],
          ),
        ),
      ),
    );
  }
}
