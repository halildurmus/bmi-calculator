import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bmi_state.dart';
import 'bmi.dart';

final bmiProvider =
    StateNotifierProvider<BmiViewModel, BmiState>((ref) => BmiViewModel());

class BmiViewModel extends StateNotifier<BmiState> {
  BmiViewModel() : super(const BmiState.initial());

  void calculate({required int height, required int weight}) {
    final bmi = Bmi(height: height, weight: weight);
    state = BmiState.calculated(bmi);
  }

  void reset() => state = const BmiState.initial();
}
