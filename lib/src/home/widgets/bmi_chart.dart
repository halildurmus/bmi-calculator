import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../l10n/localization_util.dart';

class BmiChartWidget extends StatelessWidget {
  const BmiChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const _BmiChartText(),
                Image.asset(assetBmiChartImage),
                const _CloseButton(),
              ],
            ),
          ),
        ),
      );
}

class _BmiChartText extends StatelessWidget {
  const _BmiChartText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Text(
      l(context).theBmiChart,
      style: textTheme.headline6!.copyWith(
        color: theme.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () => Navigator.pop(context),
      style: TextButton.styleFrom(foregroundColor: theme.primaryColor),
      child: Text(
        l(context).close,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
