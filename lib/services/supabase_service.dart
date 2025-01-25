import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  final supabase = Supabase.instance.client;

  // 用户认证相关方法
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    print('SupabaseService - 开始登录');
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print('SupabaseService - 登录成功: ${response.user?.email}');
      return response;
    } catch (e) {
      print('SupabaseService - 登录失败: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  // 获取当前用户
  User? get currentUser => supabase.auth.currentUser;

  // 检查用户认证状态
  Stream<AuthState> get authStateChanges => supabase.auth.onAuthStateChange;

  // 数据操作方法示例
  Future<List<Map<String, dynamic>>> getQuestions({
    required String level,
    required String category,
  }) async {
    final response = await supabase
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
    await supabase.from('user_progress').insert({
      'user_id': userId,
      'question_id': questionId,
      'is_correct': isCorrect,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 获取用户学习统计
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    final response = await supabase
        .from('user_progress')
        .select('*')
        .eq('user_id', userId)
        .single();

    return response as Map<String, dynamic>;
  }
}
