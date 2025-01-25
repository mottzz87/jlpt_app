import 'package:isar/isar.dart';

part 'question.g.dart';

@collection
class Question {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int questionId;

  late int paperId;
  late int bigQuestionId;
  String? hearingFile;
  late String content;
  String? path;
  double? score;
  String? answer;
  String? analysis;
  late int type;
  int? sortId;
  bool? isSelect;
  DateTime? createdTime;
  DateTime? updatedTime;
  String? bigQuestionContent;
  String? typeName;
  String? paperName;
  bool? correct;
  String? doAnswer;
  int? bsort;
  int? collect;
  String? collectId;
  String? examCenter;
  bool? isDone;
  int? lsort;
  int? prId;
  String? readContent;

  // 关联字段
  @ignore
  List<QuestionOption>? options;
}

@collection
class QuestionOption {
  Id id = Isar.autoIncrement;

  late int questionId;
  String? optionKey;
  String? optionValue;
}
