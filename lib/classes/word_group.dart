import 'package:afen_ielts/classes/word.dart';

class WordGroup {
  late String name;
  late List<Word> lstWord;
  late String explanation;
  late String question;
  late String example;

  WordGroup(this.name, this.lstWord, this.question);
}
