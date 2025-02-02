import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/paper.dart';
import '../../models/question.dart';
import '../../models/user.dart';
import '../../repositories/paper_repository.dart';
import '../../repositories/user_repository.dart';

class DatabaseService {
  late final Isar isar;
  late final PaperRepository paperRepository;
  late final UserRepository userRepository;

  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        PaperSchema,
        BigQuestionSchema,
        QuestionSchema,
        QuestionOptionSchema,
        QuestionReadingSchema,
        PaperQuestionTypeSchema,
        UserSchema,
        UserAnswerSchema,
        UserProgressSchema,
        AuditLogSchema,
      ],
      directory: dir.path,
    );

    paperRepository = PaperRepository(isar);
    userRepository = UserRepository(isar);
  }

  Future<void> close() async {
    await isar.close();
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
