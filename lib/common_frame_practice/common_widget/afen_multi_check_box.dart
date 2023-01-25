import 'package:afen_ielts/common_frame_practice/common_widget/afen_single_selection_rb.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenMultiCheckBox extends HookConsumerWidget {
  AfenMultiCheckBox(
    this.checkBoxName, {
    Key? key,
    this.dataSource,
    this.initValues,
  }) : super(key: key);
  List<SelectionModel>? dataSource;
  List<String> get selectedValues => (dataSource ?? [])
      .where((element) => element.isChecked)
      .map((e) => e.key)
      .toList();
  final String checkBoxName;
  List? initValues;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dataSource ??= [];
    if ((initValues ?? []).isNotEmpty) {
      dataSource!.forEach((e) {
        e.isChecked = (initValues ?? []).contains(e.key);
      });
    }

    return StatefulBuilder(builder: (context, setState) {
      // var selectedValues = values ?? [];
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(checkBoxName),
        ListView.builder(
          shrinkWrap: true,
          itemCount: dataSource!.length,
          itemBuilder: (BuildContext context, int index) {
            var row = dataSource![index];
            // row.isChecked = (values ?? []).contains(row.key);
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: row.isChecked,
              title: Text(row.label,
                  style: const TextStyle(
                      fontSize: 16.0, overflow: TextOverflow.clip)),
              onChanged: (bool? value) {
                setState(() {
                  row.isChecked = value ?? false;
                  // selectedValues.add(row.key);
                });
              },
              dense: true,
              activeColor: Colors.green,
            );
          },
        )
      ]);
    });
  }
}
