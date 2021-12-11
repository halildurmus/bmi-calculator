import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../home/models/bmi_view_model.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({
    Key? key,
    required this.height,
    required this.isBmiCalculated,
    required this.weight,
  }) : super(key: key);

  final int height;
  final bool isBmiCalculated;
  final int weight;

  void _calculateBmi(WidgetRef ref, int height, int weight) {
    final model = ref.read(bmiProvider.notifier);
    model.calculate(height: height, weight: weight);
  }

  void _resetBmi(WidgetRef ref) {
    final model = ref.read(bmiProvider.notifier);
    model.reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: actionButtonDecoration,
      child: FloatingActionButton.large(
        onPressed: isBmiCalculated
            ? () => _resetBmi(ref)
            : () => _calculateBmi(ref, height, weight),
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
