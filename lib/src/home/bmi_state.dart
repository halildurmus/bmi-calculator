import 'package:freezed_annotation/freezed_annotation.dart';

import 'models/bmi.dart';

part 'bmi_state.freezed.dart';

@freezed
abstract class BmiState with _$BmiState {
  const factory BmiState.initial() = _Initial;
  factory BmiState.calculated(Bmi bmi) = _Calculated;
}
