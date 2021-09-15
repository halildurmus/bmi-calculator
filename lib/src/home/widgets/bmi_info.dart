import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class BmiInfoWidget extends StatelessWidget {
  const BmiInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    Widget _buildFirstText() {
      return Text(
        AppLocalizations.of(context)!.bmiInfoFirst,
        key: const ValueKey<String>('BmiInfoFirst'),
        textAlign: TextAlign.center,
        style: textTheme.bodyText1!.copyWith(
          color: Colors.black54.withOpacity(.4),
          fontWeight: FontWeight.w700,
        ),
      );
    }

    Widget _buildSecondText() {
      return Text(
        AppLocalizations.of(context)!.bmiInfoSecond,
        key: const ValueKey<String>('BmiInfoSecond'),
        textAlign: TextAlign.center,
        style: textTheme.bodyText1!.copyWith(
          color: Colors.grey,
          fontSize: 11.5,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 170),
      child: Center(
        child: Column(
          children: <Widget>[
            _buildFirstText(),
            _buildSecondText(),
          ],
        ),
      ),
    );
  }
}
