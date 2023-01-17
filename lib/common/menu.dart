import 'package:afen_ielts/common/common_page/student_comment.dart';
import 'package:afen_ielts/pages/grammar/test/ielts_test_list.dart';
import 'package:flutter/material.dart';

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  late Widget mainPage;
  late Widget gamePage;
  Menu(this.name, this.destination, this.icon, this.mainPage, this.gamePage);
}

late final practiceMenuCommon = <MenuPage>[
  MenuPage("Тест", "test", Icons.format_list_numbered, const IeltsTestList(),
      const IeltsTestList()),
  MenuPage("Явц", "dashboard", Icons.border_color, StudentCommentPage(),
      StudentCommentPage()),
];

class MenuPage {
  late String name;
  late String destination;
  late IconData icon;
  late dynamic mainPage;
  late dynamic practicePage;
  MenuPage(
      this.name, this.destination, this.icon, this.mainPage, this.practicePage);
}

// late final learningMenuN5 = <Menu>[
//   Menu("Үсэг, тоо, ТҮ", "masterData", Icons.format_list_numbered, LetterPage(),
//       LetterCardPage()),
//   Menu("Ханз, Шинэ үг", "allVocabulary", Icons.border_color,
//       VocabularyListPage(), VocabularyCardPage()),
//   Menu("Дүрэм", "verbForm", Icons.rule, VerbFormPage(),
//       VerbConjugationPracticePage()),
//   Menu("Өгүүлбэр зүй", "grammer", Icons.school_rounded, GrammerPage(),
//       GrammarCardPage()),
// ];

// late final lstWordMenu = <Menu>[
//   Menu("Шинэ үг", "vocabularyN5", Icons.ac_unit, VocabularyListPage(),
//       VocabularyCardPage()),
//   Menu("Ханз", "kanji", Icons.dashboard_outlined, KanjiListPage(),
//       KanjiCardPage()),
// ];

// late final lstConjugation = <Menu>[
//   Menu("Үйл үг хувиргах", "verbConj", Icons.ac_unit, VocabularyListPage(),
//       VocabularyCardPage()),
//   Menu("Тэмдэг нэр хувиргах", "adjConj", Icons.dashboard_outlined,
//       KanjiListPage(), KanjiCardPage()),
// ];

class AfenUser {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}

class AppSetting {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}
