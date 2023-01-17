// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vocabulary_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VocabularyTestState _$VocabularyTestStateFromJson(Map<String, dynamic> json) {
  return _VocabularyTestState.fromJson(json);
}

/// @nodoc
class _$VocabularyTestStateTearOff {
  const _$VocabularyTestStateTearOff();

  _VocabularyTestState call(
      {List<dynamic> tags = const [],
      List<dynamic> vocabularyTestSource = const [],
      String? selectedId = null,
      dynamic selectedVocabularyTest = null}) {
    return _VocabularyTestState(
      tags: tags,
      vocabularyTestSource: vocabularyTestSource,
      selectedId: selectedId,
      selectedVocabularyTest: selectedVocabularyTest,
    );
  }

  VocabularyTestState fromJson(Map<String, Object> json) {
    return VocabularyTestState.fromJson(json);
  }
}

/// @nodoc
const $VocabularyTestState = _$VocabularyTestStateTearOff();

/// @nodoc
mixin _$VocabularyTestState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  List<dynamic> get vocabularyTestSource => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  dynamic get selectedVocabularyTest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VocabularyTestStateCopyWith<VocabularyTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyTestStateCopyWith<$Res> {
  factory $VocabularyTestStateCopyWith(
          VocabularyTestState value, $Res Function(VocabularyTestState) then) =
      _$VocabularyTestStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> tags,
      List<dynamic> vocabularyTestSource,
      String? selectedId,
      dynamic selectedVocabularyTest});
}

/// @nodoc
class _$VocabularyTestStateCopyWithImpl<$Res>
    implements $VocabularyTestStateCopyWith<$Res> {
  _$VocabularyTestStateCopyWithImpl(this._value, this._then);

  final VocabularyTestState _value;
  // ignore: unused_field
  final $Res Function(VocabularyTestState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? vocabularyTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedVocabularyTest = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      vocabularyTestSource: vocabularyTestSource == freezed
          ? _value.vocabularyTestSource
          : vocabularyTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVocabularyTest: selectedVocabularyTest == freezed
          ? _value.selectedVocabularyTest
          : selectedVocabularyTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$VocabularyTestStateCopyWith<$Res>
    implements $VocabularyTestStateCopyWith<$Res> {
  factory _$VocabularyTestStateCopyWith(_VocabularyTestState value,
          $Res Function(_VocabularyTestState) then) =
      __$VocabularyTestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> tags,
      List<dynamic> vocabularyTestSource,
      String? selectedId,
      dynamic selectedVocabularyTest});
}

/// @nodoc
class __$VocabularyTestStateCopyWithImpl<$Res>
    extends _$VocabularyTestStateCopyWithImpl<$Res>
    implements _$VocabularyTestStateCopyWith<$Res> {
  __$VocabularyTestStateCopyWithImpl(
      _VocabularyTestState _value, $Res Function(_VocabularyTestState) _then)
      : super(_value, (v) => _then(v as _VocabularyTestState));

  @override
  _VocabularyTestState get _value => super._value as _VocabularyTestState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? vocabularyTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedVocabularyTest = freezed,
  }) {
    return _then(_VocabularyTestState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      vocabularyTestSource: vocabularyTestSource == freezed
          ? _value.vocabularyTestSource
          : vocabularyTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVocabularyTest: selectedVocabularyTest == freezed
          ? _value.selectedVocabularyTest
          : selectedVocabularyTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VocabularyTestState implements _VocabularyTestState {
  const _$_VocabularyTestState(
      {this.tags = const [],
      this.vocabularyTestSource = const [],
      this.selectedId = null,
      this.selectedVocabularyTest = null});

  factory _$_VocabularyTestState.fromJson(Map<String, dynamic> json) =>
      _$$_VocabularyTestStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> vocabularyTestSource;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedVocabularyTest;

  @override
  String toString() {
    return 'VocabularyTestState(tags: $tags, vocabularyTestSource: $vocabularyTestSource, selectedId: $selectedId, selectedVocabularyTest: $selectedVocabularyTest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VocabularyTestState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.vocabularyTestSource, vocabularyTestSource) ||
                const DeepCollectionEquality().equals(
                    other.vocabularyTestSource, vocabularyTestSource)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.selectedVocabularyTest, selectedVocabularyTest) ||
                const DeepCollectionEquality().equals(
                    other.selectedVocabularyTest, selectedVocabularyTest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(vocabularyTestSource) ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(selectedVocabularyTest);

  @JsonKey(ignore: true)
  @override
  _$VocabularyTestStateCopyWith<_VocabularyTestState> get copyWith =>
      __$VocabularyTestStateCopyWithImpl<_VocabularyTestState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VocabularyTestStateToJson(this);
  }
}

abstract class _VocabularyTestState implements VocabularyTestState {
  const factory _VocabularyTestState(
      {List<dynamic> tags,
      List<dynamic> vocabularyTestSource,
      String? selectedId,
      dynamic selectedVocabularyTest}) = _$_VocabularyTestState;

  factory _VocabularyTestState.fromJson(Map<String, dynamic> json) =
      _$_VocabularyTestState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  List<dynamic> get vocabularyTestSource => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  dynamic get selectedVocabularyTest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VocabularyTestStateCopyWith<_VocabularyTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
