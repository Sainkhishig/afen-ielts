import 'dart:convert';

import 'package:afen_ielts/common/widget/afen_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenSingleFillQuestion extends HookConsumerWidget {
  AfenSingleFillQuestion(
    this.question, {
    Key? key,
  }) : super(key: key);
  String question;
  String answer = "";
  LineSplitter lineSplitter = const LineSplitter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              for (String text in lineSplitter.convert(question))
                TextSpan(
                    text: text,
                    style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        AfenTextField(
          question,
          onValueChanged: (p0) {
            answer = p0;
          },
        )
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
