import 'package:flutter/material.dart';

import '../../l10n/localization_util.dart';

class BmiInfoWidget extends StatelessWidget {
  const BmiInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 155, left: 16, right: 16),
          child: Column(
            children: const [
              _FirstText(),
              _SecondText(),
            ],
          ),
        ),
      );
}

class _FirstText extends StatelessWidget {
  const _FirstText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      l(context).bmiInfoFirst,
      key: const ValueKey<String>('BmiInfoFirst'),
      textAlign: TextAlign.center,
      style: textTheme.bodyText1!.copyWith(
        color: Colors.black54.withOpacity(.4),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _SecondText extends StatelessWidget {
  const _SecondText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      l(context).bmiInfoSecond,
      key: const ValueKey<String>('BmiInfoSecond'),
      textAlign: TextAlign.center,
      style: textTheme.bodyText1!.copyWith(
        color: Colors.grey,
        fontSize: 11.5,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
