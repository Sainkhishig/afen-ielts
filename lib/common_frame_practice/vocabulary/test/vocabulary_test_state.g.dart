// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_test_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VocabularyTestState _$$_VocabularyTestStateFromJson(
        Map<String, dynamic> json) =>
    _$_VocabularyTestState(
      tags: json['tags'] as List<dynamic>? ?? [],
      vocabularyTestSource:
          json['vocabularyTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedVocabularyTest: json['selectedVocabularyTest'] ?? null,
    );

Map<String, dynamic> _$$_VocabularyTestStateToJson(
        _$_VocabularyTestState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'vocabularyTestSource': instance.vocabularyTestSource,
      'selectedId': instance.selectedId,
      'selectedVocabularyTest': instance.selectedVocabularyTest,
    };
