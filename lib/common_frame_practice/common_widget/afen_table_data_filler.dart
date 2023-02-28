import 'package:afen_ielts/common/widget/afen_text_field.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenTableDataFiller extends HookConsumerWidget {
  AfenTableDataFiller(
    this.tableContent, {
    Key? key,
    // this.initValues,
    required this.sq,
    required this.eq,
  }) : super(key: key);
  // List<SelectionModel>? dataSource;
  String tableContent;
  int sq;
  int eq;

  Map<int, String> answerMap = {};
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // dataSource ??= [];
    int widgetLength = eq - sq + 1;
    int currentQuestion = sq - 1;
    return StatefulBuilder(builder: (context, setState) {
      // var selectedValues = values ?? [];
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(checkBoxName),
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
                leading: Text("$currentQuestion"),
                title: AfenTextField(
                  "$currentQuestion",
                  onValueChanged: (value) {
                    print("AfenTableDataFiller:$value");
                    answerMap[currentQuestion] = value;
                  },
                ),
              );
            }),
      ]);
    });
  }
}
