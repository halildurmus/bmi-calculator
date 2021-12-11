import 'package:flutter/material.dart';

import '../../home/models/bmi.dart';
import 'bmi_info.dart';
import 'bmi_result.dart';
import 'wave_painter.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({
    Key? key,
    this.bmiResult,
    required this.isBmiCalculated,
  }) : super(key: key);

  final Bmi? bmiResult;
  final bool isBmiCalculated;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const WavePainter(),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 1000),
        firstChild: const BmiInfoWidget(),
        secondChild: isBmiCalculated
            ? BmiResultWidget(bmi: bmiResult!)
            : const SizedBox(),
        crossFadeState: !isBmiCalculated
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}
