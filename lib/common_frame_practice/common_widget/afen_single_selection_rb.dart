import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenSingleSelectionRb extends HookConsumerWidget {
  AfenSingleSelectionRb(
    this.checkBoxName, {
    Key? key,
    this.dataSource,
    this.initValues,
  }) : super(key: key);
  List<SelectionModel>? dataSource;
  // List<String> get selectedValues => (dataSource ?? [])
  //     .where((element) => element.isChecked)
  //     .map((e) => e.key)
  //     .toList();
  final String checkBoxName;
  String selectedAnswer = "";
  List? initValues;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dataSource ??= [];
    return StatefulBuilder(builder: (context, setState) {
      // var selectedValues = values ?? [];
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(checkBoxName),
        ListView.builder(
            itemCount: dataSource!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var row = dataSource![index];
              return RadioListTile(
                title: Text(
                  row.label,
                ),
                value: row.key,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value.toString();
                    // print("radioSelection$value");
                  });
                },
              );
            }),
      ]);
    });
  }
}

class SelectionModel {
  late String key;
  late String label;

  bool isChecked;
  SelectionModel(this.key, this.label, {this.isChecked = false});
}
