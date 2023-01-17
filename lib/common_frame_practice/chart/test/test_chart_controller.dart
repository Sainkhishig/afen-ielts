import 'dart:math';

import 'package:afen_ielts/common/common_providers/shared_preferences_provider.dart';
import 'package:afen_ielts/common_frame_practice/api/tes_api.dart';
import 'package:afen_ielts/common_frame_practice/chart/test/test_chart_state.dart';
import 'package:afen_ielts/common_frame_practice/common_model/test_result_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final testChartController =
    StateNotifierProvider<TestChartController, TestChartState>(
        (ref) => TestChartController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class TestChartController extends StateNotifier<TestChartState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  List<TestResultModel> lstTestResult = [];
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(testChartController);
  }

  //#region ==================== constructor ====================
  TestChartController({required this.ref}) : super(const TestChartState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }

  //#endregion ==================== constructor ====================

  Future<void> getTestResult() async {
    lstTestResult = await CommonTestAPI().getReadingTestResult(
        prefs.getString("userId"), prefs.getInt("jlptLevel"));
    // setChartData(lstReadingTestResult);
  }

  getChartData(String testType) {
    var testResult =
        lstTestResult.where((element) => element.test == testType).toList();

    return testResult.map((e) => TestChartData(e.testDate, e.result)).toList();
  }

  //#region ==================== accessor ====================
  TestChartState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const TestChartState();

  //#endregion ==================== method ====================
}

class TestChartData {
  TestChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
