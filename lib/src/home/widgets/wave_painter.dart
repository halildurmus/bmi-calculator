import 'package:flutter/material.dart';

class _Wave {
  const _Wave({required this.color, required this.path});

  final Color color;
  final Path path;

  @override
  String toString() => '_Wave(color: $color, path: $path)';
}

class WavePainter extends CustomPainter {
  const WavePainter();

  static const _colors = <Color>[
    Color(0xFFEE7583),
    Color(0xFFF6ABB2),
    Colors.white,
  ];

  _Wave _getFirstWave(Size size) {
    final height = size.height * .7;
    final path = Path()
      ..moveTo(0, height * .35)
      ..cubicTo(
        size.width * .25,
        height * .85,
        size.width * .75,
        -10,
        size.width,
        height * .25,
      )
      ..lineTo(size.width, height)
      ..lineTo(0, height);

    return _Wave(color: _colors[0], path: path);
  }

  _Wave _getSecondWave(Size size) {
    final height = size.height * .85;
    final path = Path()
      ..moveTo(0, height * .35)
      ..cubicTo(
        size.width * .25,
        height * .75,
        size.width * .95,
        -15,
        size.width,
        height * .5,
      )
      ..lineTo(size.width, height)
      ..lineTo(0, height);

    return _Wave(color: _colors[1], path: path);
  }

  _Wave _getThirdWave(Size size) {
    final height = size.height;
    final path = Path()
      ..moveTo(0, height * .35)
      ..cubicTo(
        size.width * .25,
        height * .7,
        size.width * .75,
        10,
        size.width,
        height * .33,
      )
      ..lineTo(size.width, height)
      ..lineTo(0, height);

    return _Wave(color: _colors[2], path: path);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final firstWave = _getFirstWave(size);
    final secondWave = _getSecondWave(size);
    final thirdWave = _getThirdWave(size);
    canvas
      ..drawPath(firstWave.path, paint..color = firstWave.color)
      ..drawPath(secondWave.path, paint..color = secondWave.color)
      ..drawPath(thirdWave.path, paint..color = thirdWave.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
