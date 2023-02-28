import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AfenTableDataSelect extends HookConsumerWidget {
  AfenTableDataSelect(
    this.tableContent, {
    Key? key,
    required this.sq,
    required this.eq,
    this.selectionSource = const [],
  }) : super(key: key);
  int sq;
  int eq;
  String tableContent;
  String selectedAnswer = "";
  List<String> selectionSource;
  Map<int, String> answerMap = {};
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // dataSource ??= [];
    int widgetLength = eq - sq + 1;
    int currentQuestion = sq - 1;
    return StatefulBuilder(builder: (context, setState) {
      // var selectedValues = values ?? [];
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MarkdownBody(
          data: tableContent,
          // selectable: true,
          shrinkWrap: true,
        ),
        ListView.builder(
            itemCount: widgetLength,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              currentQuestion++;
              return ListTile(
                leading: Text("$currentQuestion."),
                title: Container(
                  width: 250,
                  padding: const EdgeInsets.only(top: 20),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    hint: const Text("Сонгох"),
                    isDense: true,
                    items: getDropItems(selectionSource),
                    onChanged: (value) async {
                      print("AfenTableDataSelect:$value");
                      answerMap[currentQuestion] = "$value";
                    },
                  )),
                ),
              );
            }),
      ]);
    });
  }
}

List<DropdownMenuItem<String>> getDropItems(List<String> source) {
  List<DropdownMenuItem<String>> lstDropItem = source
      .map((e) => DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: e,
          child: Text(
            e,
            textAlign: TextAlign.center,
          )))
      .toList();
  return lstDropItem;
}
