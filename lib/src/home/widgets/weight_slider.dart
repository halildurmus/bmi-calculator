import 'package:flutter/material.dart';

import 'slider.dart';

class WeightSlider extends StatefulWidget {
  const WeightSlider({
    Key? key,
    required this.isBmiCalculated,
    required this.onWeightChanged,
  }) : super(key: key);

  final ValueChanged<int> onWeightChanged;
  final bool isBmiCalculated;

  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  int weight = 65;

  void _onChanged(double value) {
    setState(() => weight = value.round());
    widget.onWeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      min: 40,
      max: 120,
      measurementUnit: 'kg',
      value: weight,
      onChanged: !widget.isBmiCalculated ? (value) => _onChanged(value) : null,
    );
  }
}
