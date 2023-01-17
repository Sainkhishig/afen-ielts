// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ielts_test_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IeltsTestListState _$$_IeltsTestListStateFromJson(
        Map<String, dynamic> json) =>
    _$_IeltsTestListState(
      tags: json['tags'] as List<dynamic>? ?? [],
      ieltsTestSource: json['ieltsTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedTestIndex: json['selectedTestIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_IeltsTestListStateToJson(
        _$_IeltsTestListState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'ieltsTestSource': instance.ieltsTestSource,
      'selectedId': instance.selectedId,
      'selectedTestIndex': instance.selectedTestIndex,
    };
