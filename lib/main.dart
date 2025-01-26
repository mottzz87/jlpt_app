import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'router/router.dart';
import 'services/database_service.dart';
import 'services/supabase_service.dart';
import 'services/storage_service.dart';
import 'themes/app_theme.dart';
import 'providers/auth_provider.dart';

// 用于跟踪应用生命周期
final _lastLoginId = <String>{};
final _globalKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化存储服务
  await StorageService().initialize();

  // 初始化数据库
  final database = DatabaseService();
  await database.initialize();

  // 初始化 Supabase
  await SupabaseService().initialize();

  // 初始化 AppLinks
  final appLinks = AppLinks();
  // 监听深度链接
  appLinks.uriLinkStream.listen((uri) {
    // 处理深度链接
    print('Deep link received: $uri');
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 应用进入后台时清除登录ID
      _lastLoginId.clear();
    }
  }

  void _showWelcomeMessage(User user) {
    final context = _globalKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('欢迎回来，${user.email}'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 监听认证状态
    ref.listen<AsyncValue<User?>>(authProvider, (previous, next) {
      next.whenData((user) {
        if (user != null) {
          if (!_lastLoginId.contains(user.id)) {
            _lastLoginId.add(user.id);
            // 延迟显示欢迎消息，等待路由完成
            Future.delayed(const Duration(milliseconds: 500), () {
              _showWelcomeMessage(user);
            });
          }
          context.go('/');
        } else {
          _lastLoginId.clear();
          context.go('/auth');
        }
      });
    });

    return MaterialApp.router(
      scaffoldMessengerKey: _globalKey,
      title: 'JLPT Study',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
