import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenRichTextField extends HookConsumerWidget {
  AfenRichTextField(
    this.lablel, {
    Key? key,
    this.onValueChanged,
    this.rowNumber = 3,
  }) : super(key: key);

  /// 検索機能
  final VoidCallback? onValueChanged;
  final String lablel;
  final int rowNumber;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          padding: EdgeInsets.all(8),
          width: 500,
          // height: 50,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: rowNumber,
                      controller: controller,
                      autofocus: true,
                      // textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: lablel,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.text = '';
                          },
                        ),
                      ),
                      // onFieldSubmitted: (_) async => onSearch?.call()
                    ),
                  ),
                ],
              ),
            ],
          ));
    });
  }
}
