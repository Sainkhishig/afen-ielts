import 'dart:math';

import 'package:afen_ielts/common_frame_practice/api/tes_api.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ieltsTestListController =
    StateNotifierProvider<IeltsTestListController, IeltsTestListState>(
        (ref) => IeltsTestListController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class IeltsTestListController extends StateNotifier<IeltsTestListState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  // late LoginState loginState;
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(ieltsTestListController);
  }

  //#region ==================== constructor ====================
  IeltsTestListController({required this.ref})
      : super(const IeltsTestListState()) {
    // prefs = ref.read(sharedPreferencesProvider);
    // loginState = ref.read(loginStateNotifierProvider);
  }

  //#endregion ==================== constructor ====================

  Future<void> getTestSource(int bookNumber) async {
    var lstIeltsTestList =
        await CommonTestAPI().getCambridgeIeltsSheetData(bookNumber);
    if (lstIeltsTestList.isNotEmpty) {
      print("notEmpt");
      // var selectedTesIndex =
      //     loginState.loggedIn ? 0 : getSlectedTestIndex(lstIeltsTestList);
      state = state.copyWith(ieltsTestSource: lstIeltsTestList);
      //,selectedTestIndex: selectedTesIndex);
    } else {
      print("empty");
      state = state.copyWith(ieltsTestSource: [], selectedTestIndex: 0);
    }
  }

  Future<void> getIeltsTestSource(int bookNumber) async {
    var lstIeltsTestList =
        await CommonTestAPI().getCambridgeIeltsTestData(bookNumber);
    if (lstIeltsTestList.isNotEmpty) {
      print("notEmpt");
      // var selectedTesIndex =
      //     loginState.loggedIn ? 0 : getSlectedTestIndex(lstIeltsTestList);
      state = state.copyWith(ciTestSource: lstIeltsTestList);
      //,selectedTestIndex: selectedTesIndex);
    } else {
      print("empty");
      state = state.copyWith(ciTestSource: [], selectedTestIndex: 0);
    }
  }

  Future<void> sendTestResult(testResult) async {
    final newData = <String, dynamic>{
      'userId': prefs.getString("userId"),
      'jlptLevel': prefs.getInt("jlptLevel"),
      // 'test': TestType.listening,
      'result': testResult,
      'testDate': DateTime.now().microsecondsSinceEpoch,
    };

    await _database
        .child('UserTestResult')
        .push()
        .set(newData)
        .catchError((onError) {
      print('could not send data');
      throw ("aldaa garlaa");
    });
  }

  //#region ==================== accessor ====================
  IeltsTestListState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const IeltsTestListState();

  changeTest() {
    // var selectedIndex =
    //     loginState.loggedIn ? getSlectedTestIndex(state.grammarTestSource) : 0;
    // if (loginState.isUserPlanActive) {
    //   selectedIndex =
    //       (state.grammarTestSource.length - 1) == state.selectedTestIndex
    //           ? 0
    //           : state.selectedTestIndex + 1;
    // }
    // state = state.copyWith(selectedTestIndex: selectedIndex);
  }
  //#endregion ==================== method ====================
}
