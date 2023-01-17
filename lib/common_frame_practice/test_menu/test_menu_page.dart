// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:afen_ielts/main/main_route.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:firebase_database/firebase_database.dart';

// //   KanjiTestList
// class TestMenuList extends HookConsumerWidget {
//   TestMenuList({Key? key}) : super(key: key);
//   final _database = FirebaseDatabase.instance.reference();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print("commonTestList");
//     final controller = ref.watch(kanjiTestListController.notifier);
//     GoRouter router = ref.read(mainRouteProvider).router;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("Хишиг эрдэм: Япон хэлний хичээл"),
//       // ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.,
//         children: [
//           const SizedBox(height: 24),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
//                 router.goNamed("go-kanji-test", params: {'item': "N5"});
//               },
//               child: const SizedBox(
//                   width: 120,
//                   child: Text(
//                     "Ханз",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30),
//                   )),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 print("testVoc");
//                 router.goNamed("go-vocabulary-test", params: {'item': "N4"});
//               },
//               child: const SizedBox(
//                   width: 120,
//                   child: Text(
//                     "Шинэ үг",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30),
//                   )),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 router.goNamed("go-grammar-test", params: {'item': "N4"});
//                 // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
//               },
//               child: const SizedBox(
//                   width: 120,
//                   child: Text(
//                     "Дүрэм",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30),
//                   )),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 router.goNamed("go-listening-test", params: {'item': "N4"});
//                 // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
//               },
//               child: const SizedBox(
//                   width: 120,
//                   child: Text(
//                     "Сонсгол",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30),
//                   )),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
//               },
//               child: const SizedBox(
//                   width: 120,
//                   child: Text(
//                     "Уншлага",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30),
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
