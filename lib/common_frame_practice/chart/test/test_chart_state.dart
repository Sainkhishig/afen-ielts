import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_chart_state.freezed.dart';
part 'test_chart_state.g.dart';

@freezed
abstract class TestChartState with _$TestChartState {
  const factory TestChartState({
    @Default([]) List tags,
    @Default([]) List grammarTestSource,
    @Default(null) String? selectedId,
    @Default(null) dynamic selectedTestChart,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _TestChartState;
  factory TestChartState.fromJson(Map<String, dynamic> json) =>
      _$TestChartStateFromJson(json);
}
