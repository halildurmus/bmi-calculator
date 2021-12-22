import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/models/bmi_view_model.dart';
import 'slider.dart';

class WeightSlider extends ConsumerStatefulWidget {
  const WeightSlider({Key? key, required this.onWeightChanged})
      : super(key: key);

  final ValueChanged<int> onWeightChanged;

  @override
  ConsumerState<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends ConsumerState<WeightSlider> {
  bool isBmiCalculated = false;
  int weight = 65;

  void _onChanged(double value) {
    setState(() => weight = value.round());
    widget.onWeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) => isBmiCalculated = true,
        );

    return CustomSlider(
      min: 40,
      max: 120,
      measurementUnit: 'kg',
      value: weight,
      onChanged: !isBmiCalculated ? _onChanged : null,
    );
  }
}
