import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  const CurvePainter({@required this.color, @required this.pathNo});

  final Color color;
  final int pathNo;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final Path path1 = Path();
    path1.moveTo(0, size.height * .35);
    path1.cubicTo(size.width * .25, size.height * .7, size.width * .75, 10,
        size.width, size.height * .33);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);

    final Path path2 = Path();
    path2.moveTo(0, size.height * .35);
    path2.cubicTo(size.width * .25, size.height * .75, size.width * .95, -15,
        size.width, size.height * .5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    final Path path3 = Path();
    path3.moveTo(0, size.height * .35);
    path3.cubicTo(size.width * .25, size.height * .85, size.width * .75, -10,
        size.width, size.height * .25);
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);

    switch (pathNo) {
      case 1:
        canvas.drawPath(path1, paint);
        break;
      case 2:
        canvas.drawPath(path2, paint);
        break;
      case 3:
        canvas.drawPath(path3, paint);
        break;
      default:
        canvas.drawPath(path1, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
