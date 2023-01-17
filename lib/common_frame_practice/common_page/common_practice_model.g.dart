// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_practice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommonPracticePageModel _$$_CommonPracticePageModelFromJson(
        Map<String, dynamic> json) =>
    _$_CommonPracticePageModel(
      userName: json['userName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      isChartMode: json['isChartMode'] as bool? ?? false,
      isShowSpeech: json['isShowSpeech'] as bool? ?? true,
    );

Map<String, dynamic> _$$_CommonPracticePageModelToJson(
        _$_CommonPracticePageModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'title': instance.title,
      'selectedIndex': instance.selectedIndex,
      'isChartMode': instance.isChartMode,
      'isShowSpeech': instance.isShowSpeech,
    };
