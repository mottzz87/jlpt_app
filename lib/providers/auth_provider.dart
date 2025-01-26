import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final _supabaseService = SupabaseService();

  AuthNotifier() : super(const AsyncValue.data(null)) {
    // 监听认证状态变化
    _supabaseService.authStateChanges.listen((event) {
      state = AsyncValue.data(event.session?.user);
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      state = const AsyncValue.loading();
      await _supabaseService.signUp(
        email: email,
        password: password,
    );
      state = AsyncValue.data(_supabaseService.currentUser);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = const AsyncValue.loading();
      await _supabaseService.signIn(
        email: email,
        password: password,
      );
      state = AsyncValue.data(_supabaseService.currentUser);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      state = const AsyncValue.loading();
      await _supabaseService.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  User? get currentUser => _supabaseService.currentUser;
  bool get isAuthenticated => _supabaseService.isAuthenticated;
}
