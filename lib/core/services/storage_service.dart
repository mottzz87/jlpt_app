import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  static const String _keyUser = 'user';
  static const String _keySession = 'session';

  static final StorageService _instance = StorageService._internal();
  late final SharedPreferences _prefs;

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUserSession(User user, Session session) async {
    await Future.wait([
      _prefs.setString(_keyUser, jsonEncode(user.toJson())),
      _prefs.setString(_keySession, jsonEncode(session.toJson())),
    ]);
  }

  Future<void> clearUserSession() async {
    await Future.wait([
      _prefs.remove(_keyUser),
      _prefs.remove(_keySession),
    ]);
  }

  Map<String, dynamic>? getUserData() {
    final userStr = _prefs.getString(_keyUser);
    if (userStr == null) return null;
    return jsonDecode(userStr) as Map<String, dynamic>;
  }

  Map<String, dynamic>? getSessionData() {
    final sessionStr = _prefs.getString(_keySession);
    if (sessionStr == null) return null;
    return jsonDecode(sessionStr) as Map<String, dynamic>;
  }

  bool get hasUser => _prefs.containsKey(_keyUser);
}
