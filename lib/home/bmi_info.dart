import 'package:bmicalculator/my_localizations.dart';
import 'package:flutter/material.dart';

class BmiInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 155.0),
      child: Center(
        child: Column(
          children: <Text>[
            Text(
              MyLocalizations.of(context).bmiInfoFirst,
              key: const ValueKey<String>('BmiInfoFirst'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54.withOpacity(.4),
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              MyLocalizations.of(context).bmiInfoSecond,
              key: const ValueKey<String>('BmiInfoSecond'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11.5,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
