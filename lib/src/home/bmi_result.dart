import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'bmi_chart.dart';
import '../models/bmi.dart';
import '../app_localizations.dart';

class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({Key? key, required this.bmiResult}) : super(key: key);

  final BMI bmiResult;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    Widget _buildYourBmiText() {
      return Text(
        AppLocalizations.of(context)!.yourBmi,
        style: textTheme.bodyText1!.copyWith(
          color: Colors.black.withOpacity(.55),
          fontSize: 13.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    Widget _buildBmiChartButton() {
      return GestureDetector(
        key: const ValueKey<String>('BmiChartButton'),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => const BmiChart(),
          );
        },
        child: Row(
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.theBmiChart,
              style: textTheme.bodyText1!.copyWith(
                color: kPrimaryColor,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.expand_less),
          ],
        ),
      );
    }

    Widget _buildBmiValue() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            bmiResult.wholeNumber,
            style: textTheme.headline3!.copyWith(
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            bmiResult.decimalPart,
            style: textTheme.headline5!.copyWith(
              color: kPrimaryColor,
              fontSize: 28.0,
            ),
          )
        ],
      );
    }

    Widget _buildBmiInterpretation() {
      return Center(
        child: Text(
          bmiResult.getInterpretationText(context),
          key: const ValueKey<String>('BmiInterpretationText'),
          textAlign: TextAlign.center,
          style: textTheme.bodyText1!
              .copyWith(color: bmiResult.interpretationColor),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 140.0, 24.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildYourBmiText(),
              _buildBmiChartButton(),
            ],
          ),
          _buildBmiValue(),
          const SizedBox(height: 10),
          _buildBmiInterpretation(),
        ],
      ),
    );
  }
}
