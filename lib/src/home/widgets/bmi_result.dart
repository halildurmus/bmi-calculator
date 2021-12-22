import 'package:flutter/material.dart';

import '../../l10n/localization_util.dart';
import '../models/bmi.dart';
import 'bmi_chart.dart';

class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({Key? key, required this.bmiResult}) : super(key: key);

  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 110, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _YourBmiText(),
                _BmiChartButton(),
              ],
            ),
            _BmiValue(bmiResult: bmiResult),
            const SizedBox(height: 10),
            _BmiInterpretation(bmiResult: bmiResult),
          ],
        ),
      );
}

class _BmiChartButton extends StatelessWidget {
  const _BmiChartButton({Key? key}) : super(key: key);

  void _showBmiChart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => const BmiChartWidget(),
      constraints: BoxConstraints.tight(const Size.fromWidth(500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      key: const ValueKey<String>('BmiChartButton'),
      onTap: () => _showBmiChart(context),
      child: Row(
        children: [
          Text(
            l(context).theBmiChart,
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
}

class _BmiInterpretation extends StatelessWidget {
  const _BmiInterpretation({Key? key, required this.bmiResult})
      : super(key: key);

  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        bmiResult.getInterpretationText(context),
        key: const ValueKey<String>('BmiInterpretationText'),
        textAlign: TextAlign.center,
        style:
            textTheme.bodyText1!.copyWith(color: bmiResult.interpretationColor),
      ),
    );
  }
}

class _BmiValue extends StatelessWidget {
  const _BmiValue({Key? key, required this.bmiResult}) : super(key: key);

  final Bmi bmiResult;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          bmiResult.wholeNumber,
          style: textTheme.headline3!.copyWith(color: theme.primaryColor),
        ),
        const SizedBox(height: 5),
        Text(
          bmiResult.decimalPart,
          style: textTheme.headline5!.copyWith(
            color: theme.primaryColor,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}

class _YourBmiText extends StatelessWidget {
  const _YourBmiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      l(context).yourBmi,
      style: textTheme.bodyText1!.copyWith(
        color: Colors.black.withOpacity(.55),
        fontSize: 13,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
