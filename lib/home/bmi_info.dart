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
              'Body mass index, or BMI, is used to determine whether\n you are in a healthy weight range for your height.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54.withOpacity(.4),
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "\n* This calculator shouldn't be used for pregnant women or children.",
              textAlign: TextAlign.center,
              style: TextStyle(
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
