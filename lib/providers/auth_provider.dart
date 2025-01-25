import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoggedIn;
  final String? userId;
  final String? username;

  AuthState({
    this.isLoggedIn = false,
    this.userId,
    this.username,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    String? userId,
    String? username,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userId: userId ?? this.userId,
      username: username ?? this.username,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  void login({required String userId, required String username}) {
    state = state.copyWith(
      isLoggedIn: true,
      userId: userId,
      username: username,
    );
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
