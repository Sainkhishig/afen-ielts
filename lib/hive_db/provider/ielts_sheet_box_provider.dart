import 'package:afen_ielts/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ieltsSheetBoxDataProvider =
    Provider<IeltsSheetBox>((ref) => throw UnimplementedError());

class IeltsSheetBox extends HiveBoxClass {
  IeltsSheetBox(Box box) : super(box) {}
  // List get lstKanji => box.get(lstHiveInfo[0].kanjiHive);

  // List get lstGrammar => box.get(lstHiveInfo[0].grammarHive);
  // List get lstVocabulary => box.get(lstHiveInfo[0].vocabularyHive);
}
