import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/settings.controller.dart';
import 'home_screen.dart';
import 'models/bmi.dart';
import 'models/bmi_view_model.dart';

class HomeScreenBuilder extends ConsumerWidget {
  const HomeScreenBuilder({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  void calculateBmi(
      BuildContext context, WidgetRef ref, int height, int weight) {
    final model = ref.read(bmiProvider.notifier);
    model.calculate(height: height, weight: weight);
  }

  void resetBmi(BuildContext context, WidgetRef ref) {
    final model = ref.read(bmiProvider.notifier);
    model.reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isBmiCalculated = false;
    Bmi? bmiResult;

    final state = ref.watch(bmiProvider);
    state.maybeWhen(
      initial: () => isBmiCalculated = false,
      calculated: (bmi) {
        bmiResult = bmi;
        isBmiCalculated = true;
      },
      orElse: () => null,
    );

    return HomeScreen(
      bmiResult: bmiResult,
      isBmiCalculated: isBmiCalculated,
      onReset: () => resetBmi(context, ref),
      onSubmit: (height, weight) => calculateBmi(context, ref, height, weight),
      settingsController: settingsController,
    );
  }
}
