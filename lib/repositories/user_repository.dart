import 'package:isar/isar.dart';
import '../models/user.dart';

class UserRepository {
  final Isar isar;

  UserRepository(this.isar);

  // 获取用户
  Future<User?> getUser(String userId) async {
    return isar.users.filter().userIdEqualTo(userId).findFirst();
  }

  // 根据用户名获取用户
  Future<User?> getUserByUsername(String username) async {
    return isar.users.filter().usernameEqualTo(username).findFirst();
  }

  // 根据邮箱获取用户
  Future<User?> getUserByEmail(String email) async {
    return isar.users.filter().emailEqualTo(email).findFirst();
  }

  // 保存用户
  Future<void> saveUser(User user) async {
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  // 删除用户
  Future<void> deleteUser(String userId) async {
    await isar.writeTxn(() async {
      await isar.users.filter().userIdEqualTo(userId).deleteAll();
      await isar.userAnswers.filter().userIdEqualTo(userId).deleteAll();
      await isar.userProgress.filter().userIdEqualTo(userId).deleteAll();
      await isar.auditLogs.filter().userIdEqualTo(userId).deleteAll();
    });
  }

  // 获取用户答案
  Future<List<UserAnswer>> getUserAnswers(String userId, int paperId) async {
    return isar.userAnswers
        .filter()
        .userIdEqualTo(userId)
        .paperIdEqualTo(paperId)
        .findAll();
  }

  // 保存用户答案
  Future<void> saveUserAnswer(UserAnswer answer) async {
    await isar.writeTxn(() async {
      await isar.userAnswers.put(answer);
    });
  }

  // 获取用户进度
  Future<List<UserProgress>> getUserProgress(String userId, int paperId) async {
    return isar.userProgress
        .filter()
        .userIdEqualTo(userId)
        .paperIdEqualTo(paperId)
        .findAll();
  }

  // 保存用户进度
  Future<void> saveUserProgress(UserProgress progress) async {
    await isar.writeTxn(() async {
      await isar.userProgress.put(progress);
    });
  }

  // 记录审计日志
  Future<void> logAudit(AuditLog log) async {
    await isar.writeTxn(() async {
      await isar.auditLogs.put(log);
    });
  }

  // 获取用户的审计日志
  Future<List<AuditLog>> getUserAuditLogs(String userId) async {
    return isar.auditLogs.filter().userIdEqualTo(userId).findAll();
  }
}
