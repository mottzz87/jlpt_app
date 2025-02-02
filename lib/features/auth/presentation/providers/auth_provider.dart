import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/datasources/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AsyncValue.data(null)) {
    // 初始化时检查当前用户
    final currentUser = _authService.getCurrentUser();
    if (currentUser != null) {
      state = AsyncValue.data(currentUser);
    }

    // 监听认证状态变化
    _authService.authStateChanges().listen((event) {
      if (event.event == AuthChangeEvent.signedIn) {
        state = AsyncValue.data(event.session?.user);
      } else if (event.event == AuthChangeEvent.signedOut) {
        state = const AsyncValue.data(null);
      }
    });
  }

  bool get isAuthenticated => state.value != null;

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authService.signIn(email, password);
      state = AsyncValue.data(response.user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authService.signUp(email, password);
      state = AsyncValue.data(response.user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    await _authService.signOut();
    state = const AsyncValue.data(null);
  }
}
