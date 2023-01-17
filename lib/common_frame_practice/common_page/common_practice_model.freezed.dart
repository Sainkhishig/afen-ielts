// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'common_practice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommonPracticePageModel _$CommonPracticePageModelFromJson(
    Map<String, dynamic> json) {
  return _CommonPracticePageModel.fromJson(json);
}

/// @nodoc
class _$CommonPracticePageModelTearOff {
  const _$CommonPracticePageModelTearOff();

  _CommonPracticePageModel call(
      {String userName = "",
      String title = "",
      int selectedIndex = 0,
      bool isChartMode = false,
      bool isShowSpeech = true}) {
    return _CommonPracticePageModel(
      userName: userName,
      title: title,
      selectedIndex: selectedIndex,
      isChartMode: isChartMode,
      isShowSpeech: isShowSpeech,
    );
  }

  CommonPracticePageModel fromJson(Map<String, Object> json) {
    return CommonPracticePageModel.fromJson(json);
  }
}

/// @nodoc
const $CommonPracticePageModel = _$CommonPracticePageModelTearOff();

/// @nodoc
mixin _$CommonPracticePageModel {
  String get userName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isChartMode => throw _privateConstructorUsedError;
  bool get isShowSpeech => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonPracticePageModelCopyWith<CommonPracticePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonPracticePageModelCopyWith<$Res> {
  factory $CommonPracticePageModelCopyWith(CommonPracticePageModel value,
          $Res Function(CommonPracticePageModel) then) =
      _$CommonPracticePageModelCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String title,
      int selectedIndex,
      bool isChartMode,
      bool isShowSpeech});
}

/// @nodoc
class _$CommonPracticePageModelCopyWithImpl<$Res>
    implements $CommonPracticePageModelCopyWith<$Res> {
  _$CommonPracticePageModelCopyWithImpl(this._value, this._then);

  final CommonPracticePageModel _value;
  // ignore: unused_field
  final $Res Function(CommonPracticePageModel) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? title = freezed,
    Object? selectedIndex = freezed,
    Object? isChartMode = freezed,
    Object? isShowSpeech = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isChartMode: isChartMode == freezed
          ? _value.isChartMode
          : isChartMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSpeech: isShowSpeech == freezed
          ? _value.isShowSpeech
          : isShowSpeech // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CommonPracticePageModelCopyWith<$Res>
    implements $CommonPracticePageModelCopyWith<$Res> {
  factory _$CommonPracticePageModelCopyWith(_CommonPracticePageModel value,
          $Res Function(_CommonPracticePageModel) then) =
      __$CommonPracticePageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String title,
      int selectedIndex,
      bool isChartMode,
      bool isShowSpeech});
}

/// @nodoc
class __$CommonPracticePageModelCopyWithImpl<$Res>
    extends _$CommonPracticePageModelCopyWithImpl<$Res>
    implements _$CommonPracticePageModelCopyWith<$Res> {
  __$CommonPracticePageModelCopyWithImpl(_CommonPracticePageModel _value,
      $Res Function(_CommonPracticePageModel) _then)
      : super(_value, (v) => _then(v as _CommonPracticePageModel));

  @override
  _CommonPracticePageModel get _value =>
      super._value as _CommonPracticePageModel;

  @override
  $Res call({
    Object? userName = freezed,
    Object? title = freezed,
    Object? selectedIndex = freezed,
    Object? isChartMode = freezed,
    Object? isShowSpeech = freezed,
  }) {
    return _then(_CommonPracticePageModel(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isChartMode: isChartMode == freezed
          ? _value.isChartMode
          : isChartMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSpeech: isShowSpeech == freezed
          ? _value.isShowSpeech
          : isShowSpeech // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommonPracticePageModel implements _CommonPracticePageModel {
  const _$_CommonPracticePageModel(
      {this.userName = "",
      this.title = "",
      this.selectedIndex = 0,
      this.isChartMode = false,
      this.isShowSpeech = true});

  factory _$_CommonPracticePageModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommonPracticePageModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String userName;
  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 0)
  @override
  final int selectedIndex;
  @JsonKey(defaultValue: false)
  @override
  final bool isChartMode;
  @JsonKey(defaultValue: true)
  @override
  final bool isShowSpeech;

  @override
  String toString() {
    return 'CommonPracticePageModel(userName: $userName, title: $title, selectedIndex: $selectedIndex, isChartMode: $isChartMode, isShowSpeech: $isShowSpeech)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CommonPracticePageModel &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.selectedIndex, selectedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedIndex, selectedIndex)) &&
            (identical(other.isChartMode, isChartMode) ||
                const DeepCollectionEquality()
                    .equals(other.isChartMode, isChartMode)) &&
            (identical(other.isShowSpeech, isShowSpeech) ||
                const DeepCollectionEquality()
                    .equals(other.isShowSpeech, isShowSpeech)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(selectedIndex) ^
      const DeepCollectionEquality().hash(isChartMode) ^
      const DeepCollectionEquality().hash(isShowSpeech);

  @JsonKey(ignore: true)
  @override
  _$CommonPracticePageModelCopyWith<_CommonPracticePageModel> get copyWith =>
      __$CommonPracticePageModelCopyWithImpl<_CommonPracticePageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonPracticePageModelToJson(this);
  }
}

abstract class _CommonPracticePageModel implements CommonPracticePageModel {
  const factory _CommonPracticePageModel(
      {String userName,
      String title,
      int selectedIndex,
      bool isChartMode,
      bool isShowSpeech}) = _$_CommonPracticePageModel;

  factory _CommonPracticePageModel.fromJson(Map<String, dynamic> json) =
      _$_CommonPracticePageModel.fromJson;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedIndex => throw _privateConstructorUsedError;
  @override
  bool get isChartMode => throw _privateConstructorUsedError;
  @override
  bool get isShowSpeech => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommonPracticePageModelCopyWith<_CommonPracticePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
