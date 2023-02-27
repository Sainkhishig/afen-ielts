import 'dart:convert';

import 'package:afen_ielts/common/widget/afen_text_field.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_multi_check_box.dart';
import 'package:afen_ielts/common_frame_practice/common_widget/afen_single_selection_rb.dart';
import 'package:afen_ielts/pages/grammar/model/ielts_test_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:afen_ielts/common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Blank extends StatelessWidget {
  final String answer;
  String answerHint = "";
  String value = "";
  Blank(this.answer);
  String hint = "";
  @override
  Widget build(BuildContext context) {
    print("answer:$answer");
    return SizedBox(
      height: 65,
      width: 200,
      child: AfenTextField(
        hint,
        onValueChanged: (text) {
          value = text;
        },
        // decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}

class TextWithBlanks extends StatelessWidget {
  final String text;
  static final regex = RegExp("(?={)|(?<=})");

  const TextWithBlanks({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<DropdownMenuItem<BlogType>> getDropItems() {
    //   List<DropdownMenuItem<BlogType>> lstDropItem = BlogType.values
    //       .map((e) => DropdownMenuItem<BlogType>(
    //           alignment: AlignmentDirectional.center,
    //           value: e,
    //           child: Text(
    //             e.name,
    //             textAlign: TextAlign.center,
    //           )))
    //       .toList();
    //   return lstDropItem;
    // }

    // LineSplitter ls = new LineSplitter();
    // List<String> _masForUsing = ls.convert(text);
    // print("_masForUsing:${_masForUsing.length}");
    // List _smasForUsing = text.split("\n");
    // print("_masForUsing2:${_smasForUsing.length}");

    final split = text.split(regex);
    print("split:$split");
    // BlogType category = BlogType.japanese;
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          for (String text in split)
            text.startsWith('{')
                ? WidgetSpan(
                    baseline: TextBaseline.alphabetic,
                    alignment: PlaceholderAlignment.middle,
                    child: Blank(text.substring(1, text.length - 1))
                    //       Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 30,
                    //   ),
                    //   child: Blank(text.substring(1, text.length - 1)),
                    // )
                    // Transform.translate(
                    //     offset: const Offset(0.0, 17.0),
                    //     child: Blank(text.substring(1, text.length - 1))),
                    )
                :
                // WidgetSpan(
                //     child: Transform.translate(
                //         offset: const Offset(0.0, -37.0),
                //         child: Blank(text.substring(1, text.length - 1))),
                //   )
                TextSpan(
                    text: text,
                  ),
          //  WidgetSpan(
          //     child: Padding(
          //         padding: const EdgeInsets.only(bottom: 0),
          //         child: Text(text)
          //         // TextSpan(
          //         //   text: text,
          //         // ),
          //         ))
        ],
      ),
    );
    //  RichText(
    //     text: TextSpan(
    //   children: <InlineSpan>[
    //     for (String text in split)
    //       text.startsWith('{')
    //           ? WidgetSpan(child: Blank(text.substring(1, text.length - 1)))
    //           : TextSpan(text: text),
    //   ],
    // ));
  }
}

// pyfm061 : キャンセル規定編集
class IeltsTestDetail extends HookConsumerWidget {
  IeltsTestDetail({Key? key, required this.bookNumber}) : super(key: key);
  int bookNumber;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ieltsTestListController.notifier);
    controller.setModelListenable(ref);

    final future = useMemoized(() => controller.getTestSource(bookNumber));
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Алдаа гарлаа", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    print("bookNumber");
    print(bookNumber);
    IeltsTestModel testSource = controller.state.ieltsTestSource[0];
    var questionWidgets = getQuestionWidget(testSource.answerSheet);
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
            ListView.builder(
                itemCount: testSource.answerSheet.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // IeltsTestModel testSource =
                  //     controller.state.ieltsTestSource[index];
                  var question = testSource.answerSheet[index];
                  return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          question.answerType == AnswerType.typeAhead
                              ? TextWithBlanks(text: question.questionContent)
                              : Text("${question.questionNumber}: " +
                                  question.questionContent),
                          getAnswerWidget(
                              questionWidgets[question.questionNumber])
                          // questionWidgets[question.questionNumber]!
                          //     .filledAnswerController,
                          // questionWidgets[question.questionNumber]!
                          //     .multiChoiceController,
                          // questionWidgets[question.questionNumber]!
                          //     .singleSelectController
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
                  var widget = questionWidgets[item.questionNumber];
                  List<String> selectedAnswer = getSelectedAnswerByList(widget);

                  print(widget!.filledAnswerController.controller.text);
                  var filledAnswer =
                      widget.filledAnswerController.controller.text.trim();
                  List<String> lstAnswer = [filledAnswer];

                  var isTrue = item.answers.contains(filledAnswer);
                  print("multiAnswers");
                  print(widget.multiChoiceController.selectedValues);
                  print("singleAnswer");
                  print(widget.singleSelectController.selectedAnswer);
                  print("resilt");

                  print(isTrue);
                  print(item.answers);
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
      default:
        return SizedBox();
    }
  }

  List<String> getSelectedAnswerByList(SheetItem? answerChoice) {
    if (answerChoice == null) return [];

    switch (answerChoice.answerType) {
      case AnswerType.typeAhead:
        return [answerChoice.filledAnswerController.controller.text.trim()];
      case AnswerType.fill:
        return [answerChoice.filledAnswerController.controller.text.trim()];
      case AnswerType.multiChoice:
        return answerChoice.multiChoiceController.selectedValues;
      case AnswerType.singleSelect:
        return [answerChoice.singleSelectController.selectedAnswer];
      default:
        return [""];
    }
  }
  // getQueustionMode(IeltsQuestion question) {}

  Map<int, SheetItem> getQuestionWidget(List<IeltsQuestion> questions) {
    Map<int, SheetItem> widgetBySheetItem = {};
    for (var question in questions) {
      widgetBySheetItem[question.questionNumber] = SheetItem(question);
    }

    return widgetBySheetItem;
  }
}

class SheetItem {
  int? id;

  AfenTextField filledAnswerController = AfenTextField("fill");
  AfenSingleSelectionRb singleSelectController = AfenSingleSelectionRb("fill");
  late AfenMultiCheckBox multiChoiceController;
  late AnswerType answerType;
  late List<String> selectedAnswers;
  late List<String> trueAnswers;
  SheetItem(IeltsQuestion question) {
    answerType = question.answerType;
    var ds = question.answerChoice
        .asMap()
        .entries
        .map((e) => SelectionModel(
              "${e.value.toString().split(" ")[0]}",
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
