import 'package:afen_ielts/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
/*
Questions 9 and 10
Write NO MORE THAN THREE WORDS for each answer.
9 How much does it cost to join the library?
10 When will Louise's card be ready
 */
class IeltsTestList extends HookConsumerWidget {
  const IeltsTestList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ieltsTestListController.notifier);
    controller.setModelListenable(ref);
    var router = ref.read(mainRouteProvider).router;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "CambridgeIeltsName",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                itemCount: 16,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(30),
                              primary: Colors.grey.shade100,
                              elevation: 4),
                          onPressed: () {
                            router.goNamed("redirect-test-detail",
                                params: {'item': index.toString()});

                            // router.goNamed("common-test", params: {
                            //   "tab": practiceMenuCommon[0].destination
                            // });
                            // controller.setSelectedCategory(index);
                            // _showOrderMenuSearchScreen(
                            //     context, controller);
                          },
                          child: Row(children: [
                            Text(
                              "Cambridge IELTS ${++index}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 26),
                            ),
                            const Spacer(flex: 3),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                              size: 35,
                            )
                          ])));
                })
          ]),
    ));
  }
}
