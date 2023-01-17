import 'package:freezed_annotation/freezed_annotation.dart';

part 'ielts_test_list_state.freezed.dart';
part 'ielts_test_list_state.g.dart';

@freezed
abstract class IeltsTestListState with _$IeltsTestListState {
  const factory IeltsTestListState({
    @Default([]) List tags,
    @Default([]) List ieltsTestSource,
    @Default(null) String? selectedId,
    @Default(0) int selectedTestIndex,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _IeltsTestListState;
  factory IeltsTestListState.fromJson(Map<String, dynamic> json) =>
      _$IeltsTestListStateFromJson(json);
}
