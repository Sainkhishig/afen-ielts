var lstHiveInfo = <HiveInfo>[
  HiveInfo(0, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
  HiveInfo(1, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
  HiveInfo(2, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
  HiveInfo(3, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
  HiveInfo(4, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
  HiveInfo(5, 'N4_Kanji', 'N4_Grammar', 'N4_Vocabulary'),
];

class HiveInfo {
  late int jlptLevel;
  late String kanjiHive;
  late String grammarHive;
  late String vocabularyHive;

  HiveInfo(
      this.jlptLevel, this.kanjiHive, this.grammarHive, this.vocabularyHive);
}
