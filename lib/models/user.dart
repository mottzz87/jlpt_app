import 'package:isar/isar.dart';

part 'user.g.dart';

enum UserSex {
  male,
  female,
  other,
}

enum UserStatus {
  active,
  suspended,
  inactive,
}

enum UserMode {
  standard,
  advanced,
  premium,
}

@collection
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String userId;

  @Index(unique: true)
  late String username;

  @Index(unique: true)
  late String email;

  late String passwordHash;
  String? passwordSalt;
  String? nickname;
  String? avatar;

  @enumerated
  late UserSex sex = UserSex.other;

  String? phone;
  bool emailVerified = false;

  @enumerated
  late UserStatus status = UserStatus.active;

  @enumerated
  late UserMode mode = UserMode.standard;

  int goldNumber = 0;
  int wordNumber = 0;
  DateTime? createdTime;
  DateTime? updatedTime;
  String? passwordResetToken;
  DateTime? passwordResetExpires;
  int loginAttempts = 0;
  DateTime? lastLoginAt;

  // 关联字段
  @ignore
  List<UserAnswer>? answers;
  @ignore
  List<UserProgress>? progress;
}

@collection
class UserAnswer {
  Id id = Isar.autoIncrement;

  late String userId;
  late int paperId;
  late int questionId;
  String? selectedAnswer;
  bool? isCorrect;
  DateTime answerTime = DateTime.now();
}

@collection
class UserProgress {
  Id id = Isar.autoIncrement;

  late String userId;
  late int paperId;
  late int typeId;
  double? score;
  bool isFinish = false;
  int? time;
  double? correctPercent;
}

@collection
class AuditLog {
  Id id = Isar.autoIncrement;

  late String userId;
  late String action;
  String? details;
  DateTime createdTime = DateTime.now();
}
