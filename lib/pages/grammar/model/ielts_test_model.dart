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

class CambridgeIeltsTestModel {
  late String key;
  late String bookName;
  late int bookNumber;
  late String sectionType;
  late List<IeltsTestQuestion> answerSheet;
  late DateTime writeDate;

  CambridgeIeltsTestModel(this.bookName, this.bookNumber, this.sectionType,
      this.answerSheet, this.writeDate);
  factory CambridgeIeltsTestModel.fromRTDB(Map<String, dynamic> data) {
    return CambridgeIeltsTestModel(
        data['bookName'],
        data['bookNumber'],
        data['section'],
        // data['answerSheet'],
        (data['answerSheet'] as List)
            .map((e) => IeltsTestQuestion.fromRTDB(e))
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
/*
A Action;B Comedies;C Musicals;D Romance;E Westerns;F Wildlife
Questions 9 and 10
Write NO MORE THAN THREE WORDS for each answer.
9 How much does it cost to join the library?
10 When will Louise's card be ready
Questions 19 and 20
Circle TWO letters A-E.
What does Charles say about the donkeys?
A He rode them when he was tired.
B He named them after places.
C One of them died.
D They behaved unpredictably.
E They were very small.


 */
enum AnswerType {
  singleSelect,
  multiChoice,
  fill,
  typeAhead,
  tableFill,
  tableSelect
}
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

class IeltsTestQuestion {
  late String section;
  late String questionContent;
  late String instruction;
  late int sq;
  late int eq;
  late AnswerType answerType;
  late List answerChoice;
  late Map<int, List<String>> answers;

  late DateTime writeDate;
  IeltsTestQuestion.empty();
  IeltsTestQuestion(this.section, this.questionContent, this.instruction,
      this.sq, this.eq, this.answerType, this.answerChoice, this.answers);

  factory IeltsTestQuestion.fromRTDB(Map<String, dynamic> data) {
    return IeltsTestQuestion(
        data['section'],
        data['question'],
        data['instruction'],
        data['sq'],
        data['eq'],
        AnswerType.values.byName(data['answerType']),
        data['answerChoice'] ?? [], {}
        // data['answers'] ?? {},
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
/*
Questions 16—18
Circle THREE letters A-F.
What does Charles say about his friends?
A He met them at one stage on the trip.
B They kept all their meeting arrangements.
C One of them helped arrange the transport.
D One of them owned the hotel they stayed in.
E Some of them travelled with him.
F Only one group lasted the 96 day

Complete the table below.
Write NO MORE THAN THREE WORDS for each answer.
Course Type of course:
Physical Fitness Instructor
Sports Administrator
Sports Psychologist
Physical Education
Teacher
Recreation Officer


duration and level
Example
Six-month certificate
(31)
(33)
Four-year degree in
education
(35)
Entry requirements
None
(32)
in sports administration
Degree in psychology
(34) .
None


 */
