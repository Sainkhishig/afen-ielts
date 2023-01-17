// import 'package:afen_ielts/n5/test/model/question.dart';

// class VocabularyTestModel {
//   late String key;
//   late String name;

//   late List vocabularies;
//   late List<Question> exercises;
//   late DateTime writeDate;

//   VocabularyTestModel(
//       this.name, this.vocabularies, this.exercises, this.writeDate);
//   factory VocabularyTestModel.fromRTDB(Map<String, dynamic> data) {
//     return VocabularyTestModel(
//         data['name'],
//         data['vocabularies'],
//         (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
//         data['time'] != null
//             ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
//             : DateTime.now());
//   }
// }
