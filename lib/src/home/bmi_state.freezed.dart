// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bmi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BmiStateTearOff {
  const _$BmiStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Calculated calculated(Bmi bmi) {
    return _Calculated(
      bmi,
    );
  }
}

/// @nodoc
const $BmiState = _$BmiStateTearOff();

/// @nodoc
mixin _$BmiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Bmi bmi) calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calculated value) calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BmiStateCopyWith<$Res> {
  factory $BmiStateCopyWith(BmiState value, $Res Function(BmiState) then) =
      _$BmiStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BmiStateCopyWithImpl<$Res> implements $BmiStateCopyWith<$Res> {
  _$BmiStateCopyWithImpl(this._value, this._then);

  final BmiState _value;
  // ignore: unused_field
  final $Res Function(BmiState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$BmiStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'BmiState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Bmi bmi) calculated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calculated value) calculated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BmiState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$CalculatedCopyWith<$Res> {
  factory _$CalculatedCopyWith(
          _Calculated value, $Res Function(_Calculated) then) =
      __$CalculatedCopyWithImpl<$Res>;
  $Res call({Bmi bmi});
}

/// @nodoc
class __$CalculatedCopyWithImpl<$Res> extends _$BmiStateCopyWithImpl<$Res>
    implements _$CalculatedCopyWith<$Res> {
  __$CalculatedCopyWithImpl(
      _Calculated _value, $Res Function(_Calculated) _then)
      : super(_value, (v) => _then(v as _Calculated));

  @override
  _Calculated get _value => super._value as _Calculated;

  @override
  $Res call({
    Object? bmi = freezed,
  }) {
    return _then(_Calculated(
      bmi == freezed
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as Bmi,
    ));
  }
}

/// @nodoc

class _$_Calculated implements _Calculated {
  _$_Calculated(this.bmi);

  @override
  final Bmi bmi;

  @override
  String toString() {
    return 'BmiState.calculated(bmi: $bmi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Calculated &&
            (identical(other.bmi, bmi) ||
                const DeepCollectionEquality().equals(other.bmi, bmi)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bmi);

  @JsonKey(ignore: true)
  @override
  _$CalculatedCopyWith<_Calculated> get copyWith =>
      __$CalculatedCopyWithImpl<_Calculated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Bmi bmi) calculated,
  }) {
    return calculated(bmi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
  }) {
    return calculated?.call(bmi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Bmi bmi)? calculated,
    required TResult orElse(),
  }) {
    if (calculated != null) {
      return calculated(bmi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calculated value) calculated,
  }) {
    return calculated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
  }) {
    return calculated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calculated value)? calculated,
    required TResult orElse(),
  }) {
    if (calculated != null) {
      return calculated(this);
    }
    return orElse();
  }
}

abstract class _Calculated implements BmiState {
  factory _Calculated(Bmi bmi) = _$_Calculated;

  Bmi get bmi => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CalculatedCopyWith<_Calculated> get copyWith =>
      throw _privateConstructorUsedError;
}
