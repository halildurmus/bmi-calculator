import 'package:flutter/material.dart';

import 'package:bmicalculator/constants.dart';

// Displays the slider value inside the thumb shape by overriding paint().
class _CustomSliderThumbCircle extends SliderComponentShape {
  const _CustomSliderThumbCircle({
    @required this.thumbRadius,
    @required this.min,
    @required this.max,
  });

  final double thumbRadius;
  final double min;
  final double max;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .75,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFCA4F5D),
      ),
      text: getValue(value),
    );

    final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    final Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (((max - min) * value) + min).round().toString();
  }
}

// Removes extra padding around the track by overriding getPreferredRect().
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    @required this.min,
    @required this.max,
    @required this.measurementUnit,
    @required this.onChanged,
    @required this.value,
  });

  final double min;
  final double max;
  final String measurementUnit;
  final int value;
  final ValueChanged<double> onChanged;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: const Color(0xFFF6CFD5).withOpacity(0.3),
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: kInactiveButtonTextColor,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
        trackHeight: 7.0,
        trackShape: _CustomTrackShape(),
        inactiveTrackColor: const Color(0xFFF6CFD5).withOpacity(0.3),
        activeTrackColor: Colors.white,
        thumbColor: Colors.white,
        overlayColor: Colors.white.withOpacity(0.2),
        thumbShape: _CustomSliderThumbCircle(
          thumbRadius: 16.0,
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
}
