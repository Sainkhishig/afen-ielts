import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_test_state.freezed.dart';
part 'vocabulary_test_state.g.dart';

@freezed
abstract class VocabularyTestState with _$VocabularyTestState {
  const factory VocabularyTestState({
    @Default([]) List tags,
    @Default([]) List vocabularyTestSource,
    @Default(null) String? selectedId,
    @Default(null) dynamic selectedVocabularyTest,
  }) = _VocabularyTestState;
  factory VocabularyTestState.fromJson(Map<String, dynamic> json) =>
      _$VocabularyTestStateFromJson(json);
}
