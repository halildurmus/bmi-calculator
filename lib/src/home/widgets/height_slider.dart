import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/models/bmi_view_model.dart';
import 'slider.dart';

class HeightSlider extends ConsumerStatefulWidget {
  const HeightSlider({Key? key, required this.onHeightChanged})
      : super(key: key);

  final ValueChanged<int> onHeightChanged;

  @override
  ConsumerState<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends ConsumerState<HeightSlider> {
  int height = 170;
  bool isBmiCalculated = false;

  void _onChanged(double value) {
    setState(() => height = value.round());
    widget.onHeightChanged(value.round());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (bmi) => isBmiCalculated = true,
        );

    return CustomSlider(
      min: 120,
      max: 220,
      measurementUnit: 'cm',
      value: height,
      onChanged: !isBmiCalculated ? _onChanged : null,
    );
  }
}
