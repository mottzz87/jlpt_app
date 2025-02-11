import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  Stream<AuthState> authStateChanges() {
    return _supabase.auth.onAuthStateChange;
  }

  Session? getCurrentSession() {
    return _supabase.auth.currentSession;
  }
}
