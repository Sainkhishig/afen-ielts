// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_chart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestChartState _$TestChartStateFromJson(Map<String, dynamic> json) {
  return _TestChartState.fromJson(json);
}

/// @nodoc
class _$TestChartStateTearOff {
  const _$TestChartStateTearOff();

  _TestChartState call(
      {List<dynamic> tags = const [],
      List<dynamic> grammarTestSource = const [],
      String? selectedId = null,
      dynamic selectedTestChart = null}) {
    return _TestChartState(
      tags: tags,
      grammarTestSource: grammarTestSource,
      selectedId: selectedId,
      selectedTestChart: selectedTestChart,
    );
  }

  TestChartState fromJson(Map<String, Object> json) {
    return TestChartState.fromJson(json);
  }
}

/// @nodoc
const $TestChartState = _$TestChartStateTearOff();

/// @nodoc
mixin _$TestChartState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  List<dynamic> get grammarTestSource => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  dynamic get selectedTestChart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestChartStateCopyWith<TestChartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestChartStateCopyWith<$Res> {
  factory $TestChartStateCopyWith(
          TestChartState value, $Res Function(TestChartState) then) =
      _$TestChartStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      dynamic selectedTestChart});
}

/// @nodoc
class _$TestChartStateCopyWithImpl<$Res>
    implements $TestChartStateCopyWith<$Res> {
  _$TestChartStateCopyWithImpl(this._value, this._then);

  final TestChartState _value;
  // ignore: unused_field
  final $Res Function(TestChartState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? grammarTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedTestChart = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      grammarTestSource: grammarTestSource == freezed
          ? _value.grammarTestSource
          : grammarTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTestChart: selectedTestChart == freezed
          ? _value.selectedTestChart
          : selectedTestChart // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$TestChartStateCopyWith<$Res>
    implements $TestChartStateCopyWith<$Res> {
  factory _$TestChartStateCopyWith(
          _TestChartState value, $Res Function(_TestChartState) then) =
      __$TestChartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      dynamic selectedTestChart});
}

/// @nodoc
class __$TestChartStateCopyWithImpl<$Res>
    extends _$TestChartStateCopyWithImpl<$Res>
    implements _$TestChartStateCopyWith<$Res> {
  __$TestChartStateCopyWithImpl(
      _TestChartState _value, $Res Function(_TestChartState) _then)
      : super(_value, (v) => _then(v as _TestChartState));

  @override
  _TestChartState get _value => super._value as _TestChartState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? grammarTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedTestChart = freezed,
  }) {
    return _then(_TestChartState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      grammarTestSource: grammarTestSource == freezed
          ? _value.grammarTestSource
          : grammarTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTestChart: selectedTestChart == freezed
          ? _value.selectedTestChart
          : selectedTestChart // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestChartState implements _TestChartState {
  const _$_TestChartState(
      {this.tags = const [],
      this.grammarTestSource = const [],
      this.selectedId = null,
      this.selectedTestChart = null});

  factory _$_TestChartState.fromJson(Map<String, dynamic> json) =>
      _$$_TestChartStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> grammarTestSource;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedTestChart;

  @override
  String toString() {
    return 'TestChartState(tags: $tags, grammarTestSource: $grammarTestSource, selectedId: $selectedId, selectedTestChart: $selectedTestChart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TestChartState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.grammarTestSource, grammarTestSource) ||
                const DeepCollectionEquality()
                    .equals(other.grammarTestSource, grammarTestSource)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.selectedTestChart, selectedTestChart) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTestChart, selectedTestChart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(grammarTestSource) ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(selectedTestChart);

  @JsonKey(ignore: true)
  @override
  _$TestChartStateCopyWith<_TestChartState> get copyWith =>
      __$TestChartStateCopyWithImpl<_TestChartState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestChartStateToJson(this);
  }
}

abstract class _TestChartState implements TestChartState {
  const factory _TestChartState(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      dynamic selectedTestChart}) = _$_TestChartState;

  factory _TestChartState.fromJson(Map<String, dynamic> json) =
      _$_TestChartState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  List<dynamic> get grammarTestSource => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  dynamic get selectedTestChart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TestChartStateCopyWith<_TestChartState> get copyWith =>
      throw _privateConstructorUsedError;
}
