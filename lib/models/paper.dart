import 'package:isar/isar.dart';
import 'question.dart';

part 'paper.g.dart';

enum PaperStatus {
  draft,
  published,
  archived,
  active,
}

@collection
class Paper {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int paperId;

  @Index(unique: true)
  late String name;

  late int grade;
  int? time;
  String? year;
  int? hearingTime;
  String? hearingFile;

  @enumerated
  late PaperStatus status;

  int? score;
  int goldNumber = 0;
  int? sort;
  bool isLock = false;
  bool isFinish = false;
  DateTime? createdTime;
  DateTime? updatedTime;
  int? testScore;

  // 关联字段
  @ignore
  List<BigQuestion>? bigQuestions;
  @ignore
  List<Question>? questions;
  @ignore
  List<PaperQuestionType>? questionTypes;
}

@collection
class BigQuestion {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int bigQuestionId;

  late int paperId;
  String? name;
  String? content;
  int? type;
  int? bsort;
  bool isParallel = false;
  String? hearingFile;
  int? sideNumber;
  int? collect;
  String? collectId;
  String? examCenter;
  bool? isDone;
  int? lsort;
  String? prId;
  String? readContent;
  String? bigQuestionContent;
  int? sort;
  DateTime? createdTime;
  DateTime? updatedTime;

  // 关联字段
  @ignore
  List<Question>? questions;
  @ignore
  List<QuestionReading>? readings;
}

@collection
class QuestionReading {
  Id id = Isar.autoIncrement;

  late int bigQuestionId;
  late String content;
  int sort = 1;
  DateTime? createdTime;
  DateTime? updatedTime;

  // 关联字段
  @ignore
  List<Question>? questions;
}

@collection
class PaperQuestionType {
  Id id = Isar.autoIncrement;

  late int paperId;
  late int typeId;
  double? score;
  bool isSelect = true;
  int? sort;
  String? code;
}
