import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenDateSelector extends HookConsumerWidget {
  AfenDateSelector({Key? key, required this.onDateChanged, this.label = ""})
      : super(key: key);

  final Function(DateTime?)? onDateChanged;

  String label;
  DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

  DateTime _date = DateTime.now();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return SizedBox(
          width: 200,
          // height: 50,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: controller,
                      autofocus: true,
                      readOnly: true,
                      // textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: label,
                        prefixIcon: IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                locale: const Locale('mn'),
                                context: context,
                                initialDate: _date,
                                firstDate: DateTime(DateTime.now().year - 100),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 360)));
                            if (picked != null) {
                              setState(() {
                                _date = picked;
                                controller.text = dateFormatter.format(picked);
                              });
                              onDateChanged!.call(picked);
                            }
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.text = '';
                            onDateChanged!.call(null);
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
