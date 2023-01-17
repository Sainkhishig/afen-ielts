import 'dart:math';

import 'package:afen_ielts/classes/answer_sheet.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

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

  Future<void> setGrammarList() async {
    // var lstIeltsTestList =
    //     await CommonTestAPI().getIeltsTestList(prefs.getInt("jlptLevel") ?? 5);
    // if (lstIeltsTestList.isNotEmpty) {
    //   var selectedTesIndex =
    //       loginState.loggedIn ? 0 : getSlectedTestIndex(lstIeltsTestList);
    //   state = state.copyWith(
    //       grammarTestSource: lstIeltsTestList,
    //       selectedTestIndex: selectedTesIndex);
    // } else {
    //   state = state.copyWith(grammarTestSource: [], selectedTestIndex: 0);
    // }
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
