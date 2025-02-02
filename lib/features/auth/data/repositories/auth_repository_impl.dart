import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const _keyUser = 'user';
  static const _keyIsSignedIn = 'is_signed_in';

  @override
  Future<void> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUser, email);
    await prefs.setBool(_keyIsSignedIn, true);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
    await prefs.setBool(_keyIsSignedIn, false);
  }

  @override
  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsSignedIn) ?? false;
  }

  @override
  Future<String?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUser);
  }
}
