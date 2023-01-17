import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_practice_model.dart';

final commonPracticePageProvider = StateNotifierProvider<
    CommonPracticePageController, CommonPracticePageModel>((ref) {
  return CommonPracticePageController(widgetRef: ref);
});

class CommonPracticePageController
    extends StateNotifier<CommonPracticePageModel> {
  CommonPracticePageController({required this.widgetRef})
      : super(const CommonPracticePageModel());

  final StateNotifierProviderRef widgetRef;
  @override
  CommonPracticePageModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonPracticePageProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedIndex: index);
  }

  setChartMode(bool isChartMode) async {
    state = state.copyWith(isChartMode: isChartMode);
  }
}
