import 'package:isar/isar.dart';
import '../models/paper.dart';
import '../models/question.dart';

class PaperRepository {
  final Isar isar;

  PaperRepository(this.isar);

  // 获取所有试卷
  Future<List<Paper>> getAllPapers() async {
    return isar.papers.where().findAll();
  }

  // 根据等级获取试卷
  Future<List<Paper>> getPapersByGrade(int grade) async {
    return isar.papers.filter().gradeEqualTo(grade).findAll();
  }

  // 获取单个试卷
  Future<Paper?> getPaper(int paperId) async {
    return isar.papers.filter().paperIdEqualTo(paperId).findFirst();
  }

  // 获取试卷的大题
  Future<List<BigQuestion>> getBigQuestions(int paperId) async {
    return isar.bigQuestions.filter().paperIdEqualTo(paperId).findAll();
  }

  // 获取试卷的所有题目
  Future<List<Question>> getQuestions(int paperId) async {
    return isar.questions.filter().paperIdEqualTo(paperId).findAll();
  }

  // 获取大题的所有题目
  Future<List<Question>> getQuestionsByBigQuestion(int bigQuestionId) async {
    return isar.questions
        .filter()
        .bigQuestionIdEqualTo(bigQuestionId)
        .findAll();
  }

  // 获取题目的选项
  Future<List<QuestionOption>> getQuestionOptions(int questionId) async {
    return isar.questionOptions
        .filter()
        .questionIdEqualTo(questionId)
        .findAll();
  }

  // 获取试卷的阅读材料
  Future<List<QuestionReading>> getReadings(int bigQuestionId) async {
    return isar.questionReadings
        .filter()
        .bigQuestionIdEqualTo(bigQuestionId)
        .findAll();
  }

  // 保存试卷
  Future<void> savePaper(Paper paper) async {
    await isar.writeTxn(() async {
      await isar.papers.put(paper);
    });
  }

  // 保存大题
  Future<void> saveBigQuestion(BigQuestion bigQuestion) async {
    await isar.writeTxn(() async {
      await isar.bigQuestions.put(bigQuestion);
    });
  }

  // 保存题目
  Future<void> saveQuestion(Question question) async {
    await isar.writeTxn(() async {
      await isar.questions.put(question);
    });
  }

  // 保存选项
  Future<void> saveQuestionOption(QuestionOption option) async {
    await isar.writeTxn(() async {
      await isar.questionOptions.put(option);
    });
  }

  // 保存阅读材料
  Future<void> saveReading(QuestionReading reading) async {
    await isar.writeTxn(() async {
      await isar.questionReadings.put(reading);
    });
  }

  // 删除试卷
  Future<void> deletePaper(int paperId) async {
    await isar.writeTxn(() async {
      await isar.papers.filter().paperIdEqualTo(paperId).deleteAll();
      await isar.bigQuestions.filter().paperIdEqualTo(paperId).deleteAll();
      await isar.questions.filter().paperIdEqualTo(paperId).deleteAll();
    });
  }

  // 删除大题
  Future<void> deleteBigQuestion(int bigQuestionId) async {
    await isar.writeTxn(() async {
      await isar.bigQuestions
          .filter()
          .bigQuestionIdEqualTo(bigQuestionId)
          .deleteAll();
      await isar.questions
          .filter()
          .bigQuestionIdEqualTo(bigQuestionId)
          .deleteAll();
    });
  }

  // 删除题目
  Future<void> deleteQuestion(int questionId) async {
    await isar.writeTxn(() async {
      await isar.questions.filter().questionIdEqualTo(questionId).deleteAll();
      await isar.questionOptions
          .filter()
          .questionIdEqualTo(questionId)
          .deleteAll();
    });
  }
}
