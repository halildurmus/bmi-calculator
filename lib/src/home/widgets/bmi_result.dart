import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/localization_util.dart';
import '../models/bmi.dart';
import 'bmi_chart.dart';

class BmiResultWidget extends ConsumerWidget {
  final Bmi bmi;

  const BmiResultWidget({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
          _BmiValue(bmi: bmi),
          const SizedBox(height: 10),
          _BmiInterpretation(bmi: bmi),
        ],
      ),
    );
  }
}

class _BmiChartButton extends StatelessWidget {
  const _BmiChartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      key: const ValueKey<String>('BmiChartButton'),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => const BmiChartWidget(),
        );
      },
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
  const _BmiInterpretation({Key? key, required this.bmi}) : super(key: key);

  final Bmi bmi;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        bmi.getInterpretationText(context),
        key: const ValueKey<String>('BmiInterpretationText'),
        textAlign: TextAlign.center,
        style: textTheme.bodyText1!.copyWith(color: bmi.interpretationColor),
      ),
    );
  }
}

class _BmiValue extends StatelessWidget {
  const _BmiValue({Key? key, required this.bmi}) : super(key: key);

  final Bmi bmi;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
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
