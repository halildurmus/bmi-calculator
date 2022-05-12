import 'package:flutter/material.dart';

// Displays the slider value inside the thumb shape by overriding paint().
class _CustomSliderThumbCircle extends SliderComponentShape {
  const _CustomSliderThumbCircle({
    required this.min,
    required this.max,
    required this.thumbRadius,
  });

  final double min;
  final double max;
  final double thumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(thumbRadius);

  @override
  // ignore: long-parameter-list
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .75,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFCA4F5D),
      ),
      text: getValue(value),
    );
    final tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();
    final textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) =>
      (((max - min) * value) + min).round().toString();
}

// Removes extra padding around the track by overriding getPreferredRect().
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  // ignore: long-parameter-list
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight!;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.measurementUnit,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  final double min;
  final double max;
  final String measurementUnit;
  final int value;
  final ValueChanged<double>? onChanged;

  @override
  CustomSliderState createState() => CustomSliderState();
}

class CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackShape: _CustomTrackShape(),
          thumbShape: _CustomSliderThumbCircle(
            thumbRadius: 16,
            min: widget.min,
            max: widget.max,
          ),
        ),
        child: Slider(
          value: widget.value.toDouble(),
          min: widget.min,
          max: widget.max,
          label: '${widget.value.toString()} ${widget.measurementUnit}',
          onChanged: widget.onChanged,
        ),
      );
}
