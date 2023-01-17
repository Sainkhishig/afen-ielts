import 'package:flutter/material.dart';

enum PopupMenu {
  userInfo,
  // adminConfirmationPage,
  planFee,
  commentSend,
  settings
}

extension PopupMenuExtension on PopupMenu {
  static final typeNames = {
    PopupMenu.userInfo: 'Хэрэглэгчийн мэдээлэл',
    // PopupMenu.adminConfirmationPage: 'Хэрэглэгчийн хүсэлт баталгаажуулах',
    PopupMenu.planFee: 'Онлайн хичээл, дасгалын эрх авах',
    PopupMenu.commentSend: 'Сэтгэгдэл, санал хүсэлт илгээх',
    PopupMenu.settings: 'Тохиргоо'
  };

  String get title => typeNames[this]!;
  String get planTitle => typeNames[this]!;

  static final typeIds = {
    PopupMenu.userInfo: 'userInfo',
    PopupMenu.planFee: 'planFee',
    // PopupMenu.adminConfirmationPage: 'adminConfirmationPage',
    PopupMenu.commentSend: 'commentSend',
    PopupMenu.settings: 'settings'
  };

  String get id => typeIds[this]!;
}

enum CommentType { error, improvement, thanks, other }

extension CommentTypeExtension on CommentType {
  static final typeNames = {
    CommentType.error: 'Алдаа оллоо, програм ажиллахгүй байна',
    CommentType.improvement: 'Хичээл нэмэх, засч сайжруулах хүсэлт',
    CommentType.thanks: 'Баярлалаа',
    CommentType.other: 'Бусад',
  };

  String get title => typeNames[this]!;

  static final typeIds = {
    CommentType.error: 'error',
    CommentType.improvement: 'improvement',
    CommentType.thanks: 'thanks',
    CommentType.other: 'other',
  };

  String get id => typeIds[this]!;
}

enum JlptLevel { n5, n4, n3, n2, n1 }

enum Gender { male, female }

extension GenderExtension on Gender {
  static final typeNames = {
    Gender.male: 'эр',
    Gender.female: 'эм',
  };

  String get label => typeNames[this]!;

  static final typeIds = {
    Gender.male: 'male',
    Gender.female: 'female',
  };

  String get id => typeIds[this]!;
}

enum TestType { kanji, vocabulary, grammar, listening, reading }

extension TestTypeExtension on TestType {
  static final typeNames = {
    TestType.kanji: 'ханз',
    TestType.vocabulary: 'шинэ үг',
    TestType.grammar: 'өгүүлбэр зүй',
    TestType.reading: 'уншлага',
    TestType.listening: 'сонсгол',
  };

  String get label => typeNames[this]!;

  static final typeIds = {
    TestType.kanji: 'Kanji',
    TestType.vocabulary: 'Vocabulary',
    TestType.grammar: 'Grammar',
    TestType.reading: 'Reading',
    TestType.listening: 'Listening',
  };
  static const chartColors = {
    TestType.kanji: Colors.green,
    TestType.vocabulary: Colors.pink,
    TestType.grammar: Colors.purple,
    TestType.reading: Colors.blue,
    TestType.listening: Colors.amber,
  };

  String get id => typeIds[this]!;
  Color? get chartColor => chartColors[this]!;
}
