// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_chart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestChartState _$$_TestChartStateFromJson(Map<String, dynamic> json) =>
    _$_TestChartState(
      tags: json['tags'] as List<dynamic>? ?? [],
      grammarTestSource: json['grammarTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedTestChart: json['selectedTestChart'] ?? null,
    );

Map<String, dynamic> _$$_TestChartStateToJson(_$_TestChartState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'grammarTestSource': instance.grammarTestSource,
      'selectedId': instance.selectedId,
      'selectedTestChart': instance.selectedTestChart,
    };
