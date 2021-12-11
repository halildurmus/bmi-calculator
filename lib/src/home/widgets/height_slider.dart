import 'package:flutter/material.dart';

import 'slider.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({
    Key? key,
    required this.isBmiCalculated,
    required this.onHeightChanged,
  }) : super(key: key);

  final ValueChanged<int> onHeightChanged;
  final bool isBmiCalculated;

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  int height = 170;

  void _onChanged(double value) {
    setState(() => height = value.round());
    widget.onHeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      min: 120,
      max: 220,
      measurementUnit: 'cm',
      value: height,
      onChanged: !widget.isBmiCalculated ? (value) => _onChanged(value) : null,
    );
  }
}
