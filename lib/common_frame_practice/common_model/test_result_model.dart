class TestResultModel {
  late String key;
  late String userId;
  late int jlptLevel;
  late String test;
  late double result;
  late DateTime testDate;
  TestResultModel(
      this.userId, this.jlptLevel, this.test, this.result, this.testDate);
  factory TestResultModel.fromRTDB(Map<String, dynamic> data) {
    return TestResultModel(
        data['userId'],
        data['jlptLevel'],
        data['test'] ?? 5,
        data['result'],
        data['testDate'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['testDate'])
            : DateTime.now());
  }
}
