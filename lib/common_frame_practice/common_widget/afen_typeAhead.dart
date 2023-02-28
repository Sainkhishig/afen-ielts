import 'package:afen_ielts/common/widget/afen_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenTypeAhead extends HookConsumerWidget {
  AfenTypeAhead({
    Key? key,
    this.quesiontContent = "",
  }) : super(key: key);
  String quesiontContent;

  Map<int, String> answerMap = {};
  static final regex = RegExp("(?={)|(?<=})");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final split = quesiontContent.split(regex);
    return StatefulBuilder(builder: (context, setState) {
      return Text.rich(
        TextSpan(
          children: <InlineSpan>[
            for (String text in split)
              text.startsWith('{')
                  ? WidgetSpan(
                      baseline: TextBaseline.alphabetic,
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(
                        height: 65,
                        width: 200,
                        child: AfenTextField(
                          text.substring(1, text.length - 1),
                          onValueChanged: (text) {
                            answerMap[int.parse(
                                text.substring(1, text.length - 1))] = text;
                          },
                          // decoration: InputDecoration(hintText: hint),
                        ),
                      ) //Blank(text.substring(1, text.length - 1)),
                      )
                  : TextSpan(
                      text: text,
                    ),
          ],
        ),
      );
    });
  }
}
