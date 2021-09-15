import 'package:flutter/material.dart';

import 'curve_painter.dart';

class CurvesWidget extends StatelessWidget {
  const CurvesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        SizedBox(
          height: .25 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Color(0xFFEE7583), pathNo: 3),
          ),
        ),
        SizedBox(
          height: .3 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Color(0xFFF6ABB2), pathNo: 2),
          ),
        ),
        SizedBox(
          height: .35 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Colors.white, pathNo: 1),
          ),
        ),
      ],
    );
  }
}
