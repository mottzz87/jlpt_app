import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';
import 'database_provider.dart';

class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  UserState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository _repository;

  UserNotifier(this._repository) : super(const UserState());

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _repository.getUserByUsername(username);
      if (user == null) {
        state = state.copyWith(
          isLoading: false,
          error: '用户不存在',
        );
        return;
      }

      // TODO: 验证密码

      state = state.copyWith(
        user: user,
        isLoading: false,
      );

      // 记录登录日志
      await _repository.logAudit(AuditLog()
        ..userId = user.userId
        ..action = 'LOGIN'
        ..createdTime = DateTime.now());
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> register(String username, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // 检查用户名是否已存在
      final existingUser = await _repository.getUserByUsername(username);
      if (existingUser != null) {
        state = state.copyWith(
          isLoading: false,
          error: '用户名已存在',
        );
        return;
      }

      // 检查邮箱是否已存在
      final existingEmail = await _repository.getUserByEmail(email);
      if (existingEmail != null) {
        state = state.copyWith(
          isLoading: false,
          error: '邮箱已存在',
        );
        return;
      }

      // TODO: 加密密码

      final user = User()
        ..userId = DateTime.now().millisecondsSinceEpoch.toString()
        ..username = username
        ..email = email
        ..passwordHash = password // TODO: 使用加密后的密码
        ..createdTime = DateTime.now();

      await _repository.saveUser(user);

      state = state.copyWith(
        user: user,
        isLoading: false,
      );

      // 记录注册日志
      await _repository.logAudit(AuditLog()
        ..userId = user.userId
        ..action = 'CREATE'
        ..createdTime = DateTime.now());
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> logout() async {
    if (state.user != null) {
      // 记录登出日志
      await _repository.logAudit(AuditLog()
        ..userId = state.user!.userId
        ..action = 'LOGOUT'
        ..createdTime = DateTime.now());

      state = const UserState();
    }
  }

  Future<void> updateProfile({
    String? nickname,
    String? avatar,
    UserSex? sex,
    String? phone,
  }) async {
    if (state.user == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = state.user!;
      user
        ..nickname = nickname ?? user.nickname
        ..avatar = avatar ?? user.avatar
        ..sex = sex ?? user.sex
        ..phone = phone ?? user.phone
        ..updatedTime = DateTime.now();

      await _repository.saveUser(user);

      state = state.copyWith(
        user: user,
        isLoading: false,
      );

      // 记录更新日志
      await _repository.logAudit(AuditLog()
        ..userId = user.userId
        ..action = 'UPDATE'
        ..details = '更新个人资料'
        ..createdTime = DateTime.now());
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  Future<void> saveAnswer(UserAnswer answer) async {
    if (state.user == null) return;

    try {
      await _repository.saveUserAnswer(answer);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }

  Future<void> saveProgress(UserProgress progress) async {
    if (state.user == null) return;

    try {
      await _repository.saveUserProgress(progress);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }

  Future<List<UserAnswer>> getAnswers(int paperId) async {
    if (state.user == null) return [];

    try {
      return await _repository.getUserAnswers(state.user!.userId, paperId);
    } catch (error) {
      state = state.copyWith(error: error.toString());
      return [];
    }
  }

  Future<List<UserProgress>> getProgress(int paperId) async {
    if (state.user == null) return [];

    try {
      return await _repository.getUserProgress(state.user!.userId, paperId);
    } catch (error) {
      state = state.copyWith(error: error.toString());
      return [];
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserNotifier(repository);
});
