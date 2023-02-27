class IeltsTestModel {
  late String key;
  late String bookName;
  late int bookNumber;
  late String sectionType;
  late List<IeltsQuestion> answerSheet;
  late DateTime writeDate;

  IeltsTestModel(this.bookName, this.bookNumber, this.sectionType,
      this.answerSheet, this.writeDate);
  factory IeltsTestModel.fromRTDB(Map<String, dynamic> data) {
    return IeltsTestModel(
        data['bookName'],
        data['bookNumber'],
        data['section'],
        // data['answerSheet'],
        (data['answerSheet'] as List)
            .map((e) => IeltsQuestion.fromRTDB(e))
            .toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

// 0 Section1
// 1 group
// 2 6
// 3 8
// 4 multiSelect
// 5 What types of films does Louise like?
// 6 A Action;B Comedies;C Musicals;D Romance;E Westerns;F Wildlife
// 7 true answer
enum AnswerType { singleSelect, multiChoice, fill, typeAhead }
enum IeltsSection { listening, reading, writing }

class IeltsQuestion {
  late String section;
  late bool isGroup;
  late int questionNumber;
  late int? groupQuestionEndNumber;
  late AnswerType answerType;
  late String questionContent;
  late List answerChoice;
  late List answers;

  late DateTime writeDate;
  IeltsQuestion.empty();
  IeltsQuestion(
      this.section,
      this.isGroup,
      this.questionNumber,
      this.groupQuestionEndNumber,
      this.answerType,
      this.questionContent,
      this.answerChoice,
      this.answers);

  factory IeltsQuestion.fromRTDB(Map<String, dynamic> data) {
    return IeltsQuestion(
      data['section'],
      data['isGroup'],
      data['questionNumber'],
      data['groupQuestionEndNumber'],
      AnswerType.values.byName(data['answerType']),
      data['questionContent'],
      data['answerChoice'],
      data['answers'],
    );
  }
}

// class ReadingTestModel {
//   late String key;
//   late String name;

//   late List vocabularies;
//   late List<Reading> exercises;
//   late DateTime writeDate;

//   ReadingTestModel(
//       this.name, this.vocabularies, this.exercises, this.writeDate);
//   factory ReadingTestModel.fromRTDB(Map<String, dynamic> data) {
//     return ReadingTestModel(
//         data['name'],
//         data['vocabularies'],
//         (data['exercises'] as List).map((e) => Reading.fromRTDB(e)).toList(),
//         data['time'] != null
//             ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
//             : DateTime.now());
//   }
// }

// class Reading {
//   late String section;
//   late String content;
//   late List<Question> questions;

//   late DateTime writeDate;
//   Reading(this.section, this.content, this.questions);
//   factory Reading.fromRTDB(Map<String, dynamic> data) {
//     return Reading(
//       data['section'],
//       data['content'],
//       (data['questions'] as List).map((e) => Question.fromRTDB(e)).toList(),
//     );
//   }
// }
