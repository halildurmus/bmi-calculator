import 'package:flutter/material.dart';

class _Wave {
  const _Wave({required this.color, required this.path});

  final Color color;
  final Path path;
}

class WavePainter extends CustomPainter {
  const WavePainter();

  static const List<Color> _kColors = [
    Color(0xFFEE7583),
    Color(0xFFF6ABB2),
    Colors.white
  ];

  _Wave _getFirstWave(Size size) {
    final height = size.height * .7;
    final Path path = Path();
    path.moveTo(0, height * .35);
    path.cubicTo(size.width * .25, height * .85, size.width * .75, -10,
        size.width, height * .25);
    path.lineTo(size.width, height);
    path.lineTo(0, height);

    return _Wave(color: _kColors[0], path: path);
  }

  _Wave _getSecondWave(Size size) {
    final height = size.height * .85;
    final Path path = Path();
    path.moveTo(0, height * .35);
    path.cubicTo(size.width * .25, height * .75, size.width * .95, -15,
        size.width, height * .5);
    path.lineTo(size.width, height);
    path.lineTo(0, height);

    return _Wave(color: _kColors[1], path: path);
  }

  _Wave _getThirdWave(Size size) {
    final height = size.height;
    final Path path = Path();
    path.moveTo(0, height * .35);
    path.cubicTo(size.width * .25, height * .7, size.width * .75, 10,
        size.width, height * .33);
    path.lineTo(size.width, height);
    path.lineTo(0, height);

    return _Wave(color: _kColors[2], path: path);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    final firstWave = _getFirstWave(size);
    final secondWave = _getSecondWave(size);
    final thirdWave = _getThirdWave(size);

    canvas.drawPath(firstWave.path, paint..color = firstWave.color);
    canvas.drawPath(secondWave.path, paint..color = secondWave.color);
    canvas.drawPath(thirdWave.path, paint..color = thirdWave.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
