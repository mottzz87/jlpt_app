import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/app_localizations.dart';

// 创建一个异步的 provider 来初始化 LocaleNotifier
final localeProvider =
    StateNotifierProvider<LocaleNotifier, AsyncValue<Locale>>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<AsyncValue<Locale>> {
  LocaleNotifier() : super(const AsyncValue.loading()) {
    _initializeLocale();
  }

  static const String _localeKey = 'locale';

  Future<void> _initializeLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? localeCode = prefs.getString(_localeKey);
      final locale =
          localeCode != null ? Locale(localeCode) : const Locale('zh');
      await AppLocalizations.delegate.load(locale);
      state = AsyncValue.data(locale);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> setLocale(Locale locale) async {
    try {
      state = const AsyncValue.loading();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
      await AppLocalizations.delegate.load(locale);
      state = AsyncValue.data(locale);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
