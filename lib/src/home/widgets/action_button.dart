import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../home/models/bmi_view_model.dart';

class ActionButton extends ConsumerStatefulWidget {
  const ActionButton({Key? key, required this.height, required this.weight})
      : super(key: key);

  final int height;
  final int weight;

  @override
  ConsumerState<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends ConsumerState<ActionButton> {
  bool isBmiCalculated = false;

  void _calculateBmi() {
    ref
        .read(bmiProvider.notifier)
        .calculate(height: widget.height, weight: widget.weight);
  }

  void _resetBmi() {
    ref.read(bmiProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bmiProvider).when(
          initial: () => isBmiCalculated = false,
          calculated: (_) => isBmiCalculated = true,
        );

    return DecoratedBox(
      decoration: actionButtonDecoration,
      child: FloatingActionButton.large(
        onPressed: isBmiCalculated ? _resetBmi : _calculateBmi,
        backgroundColor: Colors.white,
        elevation: 0,
        child: Icon(
          isBmiCalculated ? Icons.refresh : Icons.trending_flat,
          color: Theme.of(context).primaryColor,
          size: 48,
        ),
      ),
    );
  }
}
