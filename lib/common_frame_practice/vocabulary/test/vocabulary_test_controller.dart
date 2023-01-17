// import 'dart:math';

// import 'package:afen_ielts/common/common_enum.dart';
// import 'package:afen_ielts/common_frame_practice/api/tes_api.dart';
// import 'package:afen_ielts/common_frame_practice/vocabulary/test/vocabulary_test_state.dart';
// import 'package:afen_ielts/common_providers/shared_preferences_provider.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final vocabularyTestController =
//     StateNotifierProvider<VocabularyTestController, VocabularyTestState>(
//         (ref) => VocabularyTestController(ref: ref));
// final _database = FirebaseDatabase.instance.reference();

// class VocabularyTestController extends StateNotifier<VocabularyTestState> {
//   //#region ==================== local variable ====================
//   final StateNotifierProviderRef ref;
//   late SharedPreferences prefs;
//   Random randomVerbToExercise = Random();

//   //#endregion ==================== local variable ====================
//   void setModelListenable(WidgetRef ref) {
//     ref.watch(vocabularyTestController);
//   }

//   //#region ==================== constructor ====================
//   VocabularyTestController({required this.ref})
//       : super(const VocabularyTestState()) {
//     prefs = ref.read(sharedPreferencesProvider);
//   }

//   //#endregion ==================== constructor ====================

//   Future<void> setVocabularyList() async {
//     print("loading data...");
//     var lstVocabularyTest =
//         await CommonTestAPI().getVocabularyTest(prefs.getInt("jlptLevel") ?? 5);
//     if (lstVocabularyTest.isNotEmpty) {
//       var randomTest = lstVocabularyTest[
//           randomVerbToExercise.nextInt(lstVocabularyTest.length)];

//       state = state.copyWith(
//           vocabularyTestSource: lstVocabularyTest,
//           selectedVocabularyTest: randomTest);
//     }
//   }

//   Future<void> sendTestResult(testResult) async {
//     final newData = <String, dynamic>{
//       'userId': prefs.getString("userId"),
//       'jlptLevel': prefs.getInt("jlptLevel"),
//       'test': TestType.vocabulary.id,
//       'result': testResult,
//       'testDate': DateTime.now().microsecondsSinceEpoch,
//     };

//     await _database
//         .child('UserTestResult')
//         .push()
//         .set(newData)
//         .catchError((onError) {
//       print('could not send data');
//       throw ("aldaa garlaa");
//     });
//   }

//   //#region ==================== accessor ====================
//   VocabularyTestState get testState => state;

//   //#endregion ==================== accessor ====================

//   //#region ==================== method ====================
//   clearState() => state = const VocabularyTestState();

//   changeTest() {
//     print("setNextTest");
//     var randomTest = state.vocabularyTestSource[
//         randomVerbToExercise.nextInt(state.vocabularyTestSource.length)];
//     state = state.copyWith(selectedVocabularyTest: randomTest);
//   }
//   //#endregion ==================== method ====================
// }
