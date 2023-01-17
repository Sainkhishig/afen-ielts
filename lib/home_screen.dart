import 'package:afen_ielts/classes/answer_sheet.dart';
import 'package:afen_ielts/common/common_providers/shared_preferences_provider.dart';
import 'package:afen_ielts/common/menu.dart';
import 'package:afen_ielts/pages/grammar/model/ielts_test_model.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:afen_ielts/home_screen_controller.dart';
import 'package:afen_ielts/main/login_state.dart';
import 'package:afen_ielts/main/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

class HomeScreen extends HookConsumerWidget {
  final String? user_id;
  final FirebaseAuth? auth;

  HomeScreen({Key? key, this.user_id, this.auth}) : super(key: key);

  List<DropdownMenuItem<int>> getDropItems() {
    List<DropdownMenuItem<int>> lstDropItem = [];
    for (var i = 0; i <= 5; i++) {
      lstDropItem.add(DropdownMenuItem<int>(
          alignment: AlignmentDirectional.center,
          value: i,
          child: Text(
            i == 0 ? "Анхан шат" : "N$i түвшин",
            textAlign: TextAlign.center,
          )));
    }
    return lstDropItem;
  }

  int selectedLevel = 5;
  late GoRouter router;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginState loginState = ref.read(loginStateNotifierProvider);
    router = ref.read(mainRouteProvider).router;
    var controller = ref.read(homeScreenController.notifier);
    selectedLevel = loginState.hiveInfo.jlptLevel;
    var pref = ref.read(sharedPreferencesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Хишиг эрдэм: IELTS шалгалтад бие даан бэлдэх"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          // StatefulBuilder(
          //   builder: (context, setState) {
          //     return Stack(
          //       children: [
          //         // Text("$title"),
          //         Container(
          //           width: 250,
          //           padding: const EdgeInsets.only(top: 20),
          //           child: DropdownButtonHideUnderline(
          //               child: DropdownButtonFormField(
          //             dropdownColor: Colors.white,
          //             hint: const Text("сурах түвшингээ сонгоно уу"),
          //             isDense: true,
          //             items: getDropItems(),
          //             value: loginState.hiveInfo.jlptLevel,
          //             onChanged: (value) {
          //               setState(() async {
          //                 selectedLevel = int.parse("$value");
          //                 await pref.setInt("jlptLevel", selectedLevel);
          //               });
          //             },
          //           )),
          //         ),
          //         Positioned(
          //             left: 10,
          //             top: 10,
          //             child: Container(
          //               color: Colors.white,
          //               child: const Text("Япон хэлний түвшин"),
          //             )),
          //       ],
          //     );
          //   },
          // ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                router.goNamed("common-test",
                    params: {"tab": practiceMenuCommon[0].destination});

                // movePracticeCommonPage(context, int.parse("$selectedLevel"));
              },
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Тест",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: pickExcel,
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Excel import",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Visibility(
            visible: loginState.userName == "ari.ariuka67@gmail.com",
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  router.goNamed("adminConfirmationPage");
                },
                child: const SizedBox(
                    width: 120,
                    child: Text(
                      "Админ№",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
          )

          // MediaUploader(),
          // Center(
          //   child: LoadingButton(
          //     widgetKey: "readListeningPath",
          //     onPressed: () {},
          //     textLabel: 'readListeningPath',
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> pickExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("resultAri");
    if (result != null) {
      print("result has");

      PlatformFile file = result.files.first;
      var excel = Excel.decodeBytes(file.bytes!);
      readExcel(excel);
      // for (var element in excel.sheets.values) {
      //   print(element.sheetName);
      //   for (var i = 1; i < excel.tables[element.sheetName]!.rows.length; i++) {
      //     var row = excel.tables[element.sheetName]!.rows[i];
      //     print("row:${row[0]!.value}");
      //   }
      // }
      // for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {}
      // File file = File(filePath!);
    } else {
      // User canceled the picker
    }

    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
  }
// 0 Section1
// 1 group
// 2 6
// 3 8
// 4 multiSelect
// 5 What types of films does Louise like?
// 6 A Action;B Comedies;C Musicals;D Romance;E Westerns;F Wildlife

// late String section;
//   late bool isGroup;
//   late int questionNumber;
//   late int? groupQuestionEndNumber;
//   late AnswerType answerType;
//   late String questionContent;
//   late List<String> answerChoice;
//   late List<String> answers;

//   late DateTime writeDate;
//CambridgeIelts2-Listening1
  Future readExcel(Excel excel) async {
    final _database = FirebaseDatabase.instance.reference();

    for (var file in excel.sheets.values
        .where((element) => element.sheetName.startsWith("Cambridge"))) {
      var sheetName = file.sheetName.split("-")[0];
      var sectionName = file.sheetName.split("-")[1];
      print(sectionName);
      List<IeltsQuestion> lstQUestion = [];
      for (var i = 0; i < excel.tables[file.sheetName]!.rows.length; i++) {
        var row = excel.tables[file.sheetName]!.rows[i];
        print("row:${getCellValue(row[0])!}");
        // int trueAnswerIndex = int.parse(getCellValue(row[5]));
        // var cambridgeIeltsIndex = getCellValue(row[0]);
        var question = IeltsQuestion.empty()
          ..section = getCellValue(row[0])
          ..isGroup = getCellValue(row[1]).isNotEmpty
          ..questionNumber = int.parse(getCellValue(row[2]))
          ..groupQuestionEndNumber = getCellValue(row[3]).isEmpty
              ? null
              : int.parse(getCellValue(row[3]))
          ..answerType = AnswerType
              .singleSelect // AnswerType.values.byName(getCellValue(row[4]))
          ..questionContent = getCellValue(row[5])
          ..answerChoice = getCellValue(row[6]).split(";")
          ..answers = getCellValue(row[7]).split(";");
        lstQUestion.add(question);

        final newData = <String, dynamic>{
          'cambridgeIelts': sheetName,
          'section': sectionName,
          'answerSheet': lstQUestion.map((question) => {
                'section': question.section,
                'isGroup': question.isGroup,
                'questionNumber': question.questionNumber,
                'groupQuestionEndNumber': question.groupQuestionEndNumber,
                'answerType': question.answerType.name,
                'questionContent': question.questionContent,
                'answerChoice': question.answerChoice,
                'answers': question.answers
              }),
          'time': DateTime.now().microsecondsSinceEpoch
        };

        await _database
            .child('IeltsAnswerSheet')
            .push()
            .set(newData)
            .catchError((onError) {
          print('could not saved data');
          throw ("aldaa garlaa");
        });
      }
    }
  }

  movePracticeCommonPage(context, int jlptLevel) {
    print("testlevel:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("common-test",
            params: {"tab": practiceMenuCommon[0].destination});
        // router
        //     .goNamed("n5-test", params: {"tab": practiceMenuN5[0].destination});
        break;
      case 4:
        router.goNamed("common-test",
            params: {"tab": practiceMenuCommon[0].destination});
        break;
      case 3:
        break;
      case 2:
        break;
      case 1:
        break;
      default:
    }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => commonPage));
  }
}

String getCellValue(Data? row) {
  return row == null
      ? ""
      : row.value == null
          ? ""
          : "${row.value}";
}
