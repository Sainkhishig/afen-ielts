import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_practice_model.freezed.dart';
part 'common_practice_model.g.dart';

@freezed
abstract class CommonPracticePageModel with _$CommonPracticePageModel {
  const factory CommonPracticePageModel({
    @Default("") String userName,
    @Default("") String title,
    @Default(0) int selectedIndex,
    @Default(false) bool isChartMode,
    @Default(true) bool isShowSpeech,
  }) = _CommonPracticePageModel;
  factory CommonPracticePageModel.fromJson(Map<String, dynamic> json) =>
      _$CommonPracticePageModelFromJson(json);
}
