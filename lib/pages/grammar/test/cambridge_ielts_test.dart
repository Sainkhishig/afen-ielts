import 'dart:async';
import 'dart:typed_data';

import 'package:afen_ielts/common/loading_button.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_multi_check_box.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_single_fill_question.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_single_selection_rb.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_table_data_filler.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_table_data_select.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_typeAhead.dart';
import 'package:afen_ielts/pages/grammar/model/ielts_test_model.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

// pyfm061 : キャンセル規定編集
class CambridgeIeltsTest extends HookConsumerWidget {
  CambridgeIeltsTest({Key? key, required this.bookNumber}) : super(key: key);
  int bookNumber;
  // List<AudioPlayer> audioPlayers = List.generate(
  //   4,
  //   (_) => AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  // );
  // int selectedPlayerIdx = 0;
  // AudioPlayer get selectedAudioPlayer => audioPlayers[selectedPlayerIdx];
  List<StreamSubscription> streams = [];
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ieltsTestListController.notifier);
    controller.setModelListenable(ref);

    final future = useMemoized(() => controller.getIeltsTestSource(bookNumber));
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Алдаа гарлаа", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    print("bookNumber");
    print(bookNumber);
    CambridgeIeltsTestModel testSource = controller.state.ciTestSource[0];
    var questionWidgets = getQuestionWidget(testSource.answerSheet);

    // AudioPlayer player = AudioPlayer();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "Cambridge IELTS ${bookNumber}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                LoadingButton(
                  widgetKey: "loadingButton",
                  onPressed: () async {
                    // String audioasset = "assets/cambridgeiealts/2/01.mp3";
                    await player
                        .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
                    player.play();
                  },
                  textLabel: '▶',
                ),
                LoadingButton(
                  widgetKey: "loadingButton",
                  onPressed: () async {
                    // String audioasset = "assets/cambridgeiealts/2/01.mp3";
                    // await player
                    //     .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
                    player.setSpeed(1.25);
                  },
                  textLabel: 'x1.5',
                ),
                LoadingButton(
                  widgetKey: "loadingButton",
                  onPressed: () async {
                    // String audioasset = "assets/cambridgeiealts/2/01.mp3";
                    // await player
                    //     .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
                    player.setSpeed(1.0);
                  },
                  textLabel: 'x1',
                ),
                LoadingButton(
                  widgetKey: "loadingButton",
                  onPressed: () async {
                    // String audioasset = "assets/cambridgeiealts/2/01.mp3";
                    // await player
                    //     .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
                    player.seek(Duration(seconds: 40));
                  },
                  textLabel: 'seek',
                ),
                LoadingButton(
                  widgetKey: "loadingButton",
                  onPressed: () async {
                    // String audioasset = "assets/cambridgeiealts/2/01.mp3";
                    // await player
                    //     .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
                    player.stop();
                  },
                  textLabel: 'stop',
                ),
              ],
            ),
            // ElevatedButton.icon(
            //     onPressed: () async {
            //       // String audioasset = "assets/cambridgeiealts/2/01.mp3";
            //       await player
            //           .setUrl('asset:///assets/cambridgeiealts/2/01.mp3');
            //       player.play();
            //     },
            //     icon: Icon(Icons.play_arrow),
            //     label: Text("Play")),
            ListView.builder(
                itemCount: testSource.answerSheet.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // CambridgeIeltsTestModel testSource =
                  //     controller.state.ieltsTestSource[index];
                  var question = testSource.answerSheet[index];
                  print("question$index${question.answerType}");
                  return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                              visible: question.section.trim().isNotEmpty,
                              child: Text(
                                "Section ${question.section}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          Text(
                            question.instruction,
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          getAnswerWidget(questionWidgets[question.sq])
                        ],
                      ));
                }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.grey.shade100,
                  elevation: 4),
              onPressed: () {
                // controller.setSelectedCategory(index);
                // _showOrderMenuSearchScreen(
                //     context, controller);
                for (var item in testSource.answerSheet) {
                  var widget = questionWidgets[item.sq];
                  // List<String> selectedAnswer = getSelectedAnswerByList(widget);

                  // print(widget!.filledAnswerController.controller.text);
                  // var filledAnswer =
                  //     widget.filledAnswerController.controller.text.trim();
                  // List<String> lstAnswer = [filledAnswer];

                  // var isTrue = item.answers.contains(filledAnswer);
                  // print("multiAnswers");
                  // print(widget.multiChoiceController.selectedValues);
                  // print("singleAnswer");
                  // print(widget.singleSelectController.selectedAnswer);
                  // print("resilt");

                  // print(isTrue);
                  // print(item.answers);
                }
              },
              child: const Text(
                "Шалга",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ]),
    ));
  }

  getAnswerWidget(SheetItem? answerChoice) {
    if (answerChoice == null) return const SizedBox();
    switch (answerChoice.answerType) {
      case AnswerType.fill:
        return answerChoice.filledAnswerController;
      case AnswerType.multiChoice:
        return answerChoice.multiChoiceController;
      case AnswerType.singleSelect:
        return answerChoice.singleSelectController;
      case AnswerType.tableFill:
        return answerChoice.tableDataFillController;
      case AnswerType.tableSelect:
        return answerChoice.tableDataSelectController;
      case AnswerType.typeAhead:
        return answerChoice.typeAheadController;
      default:
        return SizedBox();
    }
  }

  Map<int, SheetItem> getQuestionWidget(List<IeltsTestQuestion> questions) {
    Map<int, SheetItem> widgetBySheetItem = {};
    for (var question in questions) {
      widgetBySheetItem[question.sq] = SheetItem(question);
    }

    return widgetBySheetItem;
  }
}

class SheetItem {
  int? id;
  AfenTypeAhead typeAheadController = AfenTypeAhead(
    quesiontContent: "",
  );
  AfenTableDataFiller tableDataFillController = AfenTableDataFiller(
    "",
    eq: 1,
    sq: 5,
  );
  AfenTableDataSelect tableDataSelectController = AfenTableDataSelect(
    "",
    eq: 1,
    sq: 5,
  );
  AfenSingleFillQuestion filledAnswerController =
      AfenSingleFillQuestion("fill");
  AfenSingleSelectionRb singleSelectController = AfenSingleSelectionRb("fill");
  late AfenMultiCheckBox multiChoiceController;
  late AnswerType answerType;
  late List<String> selectedAnswers;
  late List<String> trueAnswers;
  SheetItem(IeltsTestQuestion question) {
    typeAheadController.quesiontContent = question.questionContent;
    tableDataFillController.tableContent = question.questionContent;
    filledAnswerController.question = question.questionContent;
    tableDataFillController.sq = question.sq;
    tableDataFillController.eq = question.eq;
    tableDataSelectController.tableContent = question.questionContent;
    tableDataSelectController.selectionSource =
        question.answerChoice.map((item) => item.toString()).toList();
    tableDataSelectController.sq = question.sq;
    tableDataSelectController.eq = question.eq;
    answerType = question.answerType;
    var ds = question.answerChoice
        .asMap()
        .entries
        .map((e) => SelectionModel(
              e.value.toString().split(" ")[0],
              e.value,
            ))
        .toList();

    multiChoiceController = AfenMultiCheckBox(
      "",
      dataSource: ds,
    );
    singleSelectController = AfenSingleSelectionRb(
      "",
      dataSource: ds,
    );
  }
}
