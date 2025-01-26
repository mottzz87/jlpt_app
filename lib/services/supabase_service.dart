import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/constants/supabase_constants.dart';
import 'storage_service.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  late final SupabaseClient _client;
  final _storageService = StorageService();

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal();

  Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConstants.supabaseUrl,
      anonKey: SupabaseConstants.supabaseAnonKey,
    );
    _client = Supabase.instance.client;

    // 检查缓存的会话
    final sessionData = _storageService.getSessionData();
    if (sessionData != null) {
      final session = Session.fromJson(sessionData);
      final refreshToken = session?.refreshToken;
      if (refreshToken != null) {
        _client.auth.setSession(refreshToken);
      }
    }
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      if (response.session != null) {
        await _storageService.saveUserSession(
          response.user!,
          response.session!,
        );
      }
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await _storageService.saveUserSession(
        response.user!,
        response.session!,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
      await _storageService.clearUserSession();
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is AuthException) {
      return Exception(error.message);
    }
    return Exception('发生未知错误');
  }

  SupabaseClient get client => _client;
  bool get isAuthenticated => _client.auth.currentUser != null;
  User? get currentUser => _client.auth.currentUser;

  // 检查用户认证状态
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  // 数据操作方法示例
  Future<List<Map<String, dynamic>>> getQuestions({
    required String level,
    required String category,
  }) async {
    final response = await _client
        .from('questions')
        .select()
        .eq('level', level)
        .eq('category', category);

    return List<Map<String, dynamic>>.from(response);
  }

  // 用户进度跟踪
  Future<void> saveProgress({
    required String userId,
    required String questionId,
    required bool isCorrect,
  }) async {
    await _client.from('user_progress').insert({
      'user_id': userId,
      'question_id': questionId,
      'is_correct': isCorrect,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 获取用户学习统计
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    final response = await _client
        .from('user_progress')
        .select('*')
        .eq('user_id', userId)
        .single();

    return response as Map<String, dynamic>;
  }
}
