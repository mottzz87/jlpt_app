import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/router/app_router.dart';
import 'core/services/database_service.dart';
import 'core/services/storage_service.dart';
import 'core/services/supabase_service.dart';
import 'core/theme/providers/locale_provider.dart';
import 'core/theme/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 先初始化存储服务
  await StorageService().initialize();
  // 然后初始化 Supabase（它依赖存储服务）
  await SupabaseService().initialize();
  // 最后初始化数据库
  await DatabaseService().initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);

    // 根据主题模式设置系统UI样式
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(
        ThemeUtils.getSystemUiStyle(isDarkMode));

    return MaterialApp.router(
      title: 'JLPT Study App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      locale: localeState.when(
        data: (locale) => locale,
        loading: () => const Locale('zh'),
        error: (_, __) => const Locale('zh'),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
