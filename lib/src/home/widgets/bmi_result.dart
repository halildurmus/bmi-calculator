import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bmi.dart';
import 'bmi_chart.dart';

class BmiResultWidget extends ConsumerWidget {
  const BmiResultWidget({Key? key, required this.bmi}) : super(key: key);

  final Bmi bmi;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    Widget _buildYourBmiText() {
      return Text(
        AppLocalizations.of(context)!.yourBmi,
        style: textTheme.bodyText1!.copyWith(
          color: Colors.black.withOpacity(.55),
          fontSize: 13,
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
            builder: (BuildContext context) => const BmiChartWidget(),
          );
        },
        child: Row(
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.theBmiChart,
              style: textTheme.bodyText1!.copyWith(
                color: theme.primaryColor,
                fontSize: 12,
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
            bmi.wholeNumber,
            style: textTheme.headline3!.copyWith(color: theme.primaryColor),
          ),
          const SizedBox(height: 5),
          Text(
            bmi.decimalPart,
            style: textTheme.headline5!.copyWith(
              color: theme.primaryColor,
              fontSize: 28,
            ),
          )
        ],
      );
    }

    Widget _buildBmiInterpretation() {
      return Center(
        child: Text(
          bmi.getInterpretationText(context),
          key: const ValueKey<String>('BmiInterpretationText'),
          textAlign: TextAlign.center,
          style: textTheme.bodyText1!.copyWith(color: bmi.interpretationColor),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 140, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_buildYourBmiText(), _buildBmiChartButton()],
          ),
          _buildBmiValue(),
          const SizedBox(height: 10),
          _buildBmiInterpretation(),
        ],
      ),
    );
  }
}
