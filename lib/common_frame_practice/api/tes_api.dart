import 'package:afen_ielts/pages/grammar/model/ielts_test_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:afen_ielts/common_frame_practice/common_model/test_result_model.dart';
import 'package:afen_ielts/common_frame_practice/vocabulary/model/vocabulary_model.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/popup_menu_pages/user_info/model/plan_model.dart';

class CommonTestAPI {
  final _database = FirebaseDatabase.instance.reference();

  // Future<List> getVocabularyTest(level) async {
  //   var ref = _database.child("/VocabularyTest");
  //   var vocDb = await ref.orderByChild("jlptLevel").equalTo(level).once();
  //   if (vocDb.value == null) return [];
  //   final rtdb = Map<String, dynamic>.from(vocDb.value);
  //   var lstTest = [];
  //   rtdb.forEach((keyUser, value) {
  //     final vocabularyTest =
  //         VocabularyTestModel.fromRTDB(Map<String, dynamic>.from(value));
  //     lstTest.add(vocabularyTest);
  //   });
  //   return lstTest;
  // }

  Future<List<IeltsTestModel>> getCambridgeIeltsSheetData(
      int bookNumber) async {
    print("get:book:$bookNumber");
    var ref = _database.child("/IeltsAnswerSheet");
    var rtdb = await ref.orderByChild("bookNumber").equalTo(bookNumber).once();

    print("bookNumber5");
    // print(rtdb.value);
    if (rtdb.value == null) return [];
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);

    List<IeltsTestModel> lstTest = [];
    rtdbVal.forEach((keyUser, value) {
      final testResult =
          IeltsTestModel.fromRTDB(Map<String, dynamic>.from(value));

      lstTest.add(testResult);
    });

    return lstTest; //.where((element) => element.bookNumber == level).toList();
  }

  Future<List<CambridgeIeltsTestModel>> getCambridgeIeltsTestData(
      int bookNumber) async {
    print("get:book:$bookNumber");
    var ref = _database.child("/CambridgeIeltsTest");
    var rtdb = await ref.orderByChild("bookNumber").equalTo(bookNumber).once();

    print("bookNumber5");
    print(rtdb.value);
    if (rtdb.value == null) return [];
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);

    List<CambridgeIeltsTestModel> lstTest = [];
    rtdbVal.forEach((keyUser, value) {
      final testResult =
          CambridgeIeltsTestModel.fromRTDB(Map<String, dynamic>.from(value));
      print("convertSuccses");
      lstTest.add(testResult);
    });

    return lstTest; //.where((element) => element.bookNumber == level).toList();
  }

  Future<List<TestResultModel>> getReadingTestResult(userId, level) async {
    var ref = _database.child("/UserTestResult");
    var rtdb = await ref.orderByChild("userId").equalTo(userId).once();

    if (rtdb.value == null) return [];
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);

    List<TestResultModel> lstTest = [];
    rtdbVal.forEach((keyUser, value) {
      final testResult =
          TestResultModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(testResult);
    });

    return lstTest.where((element) => element.jlptLevel == level).toList();
  }

  Future<List> getPlanInfo(userId, level) async {
    var ref = _database.child("/UserPlan");
    var planData = await ref.orderByChild("userId").equalTo(level).once();

    if (planData.value == null) return [];
    final rtdb = Map<String, dynamic>.from(planData.value);
    List<PlanModel> lstPlan = [];
    rtdb.forEach((keyUser, value) {
      if (value != null) {
        final kanjiTest = PlanModel.fromRTDB(Map<String, dynamic>.from(value));
        lstPlan.add(kanjiTest);
      }
    });
    var dateLimit = DateTime.now().add(Duration(days: -1));
    var lstResult = lstPlan
        .where((element) =>
            element.isApproved &&
            element.level == level &&
            element.endDate.isAfter(dateLimit))
        .toList();
    return lstResult;
  }

  Future<bool> setPlanInfo(LoginState loginState) async {
    print("uid${loginState.userId}");
    int level = loginState.hiveInfo.jlptLevel;
    var ref = _database.child("/UserPlan");
    var planData =
        await ref.orderByChild("userId").equalTo(loginState.userId).once();
    if (planData.value == null) return false;
    final rtdb = Map<String, dynamic>.from(planData.value);
    List<PlanModel> lstPlan = [];
    rtdb.forEach((keyUser, value) {
      if (value != null) {
        final kanjiTest = PlanModel.fromRTDB(Map<String, dynamic>.from(value));
        lstPlan.add(kanjiTest);
      }
    });
    var dateLimit = DateTime.now().add(const Duration(days: -1));

    var lstResult = lstPlan
        .where((element) =>
            element.isApproved &&
            element.level == "N$level" &&
            element.endDate.isAfter(dateLimit))
        .toList();
    loginState.isUserPlanActive = lstResult.isNotEmpty;
    print("planState:${loginState.isUserPlanActive}");
    if (lstResult.isNotEmpty) {
      loginState.lstUserPlan = lstResult;
    }
    return lstResult.isNotEmpty;
  }
}
