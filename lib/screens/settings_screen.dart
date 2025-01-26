import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final authNotifier = ref.read(authProvider.notifier);
    final localeNotifier = ref.read(localeProvider.notifier);
    final localeState = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.settingsLanguage),
            trailing: Text(
              localeState.when(
                data: (locale) {
                  switch (locale.languageCode) {
                    case 'zh':
                      return '简体中文';
                    case 'en':
                      return 'English';
                    case 'ja':
                      return '日本語';
                    default:
                      return '简体中文';
                  }
                },
                loading: () => '加载中...',
                error: (_, __) => '错误',
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(l10n.settingsLanguage),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('简体中文'),
                          trailing: localeState.when(
                            data: (locale) => locale.languageCode == 'zh'
                                ? const Icon(Icons.check, color: Colors.green)
                                : null,
                            loading: () => null,
                            error: (_, __) => null,
                          ),
                          onTap: () async {
                            await localeNotifier.setLocale(const Locale('zh'));
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        ListTile(
                          title: const Text('English'),
                          trailing: localeState.when(
                            data: (locale) => locale.languageCode == 'en'
                                ? const Icon(Icons.check, color: Colors.green)
                                : null,
                            loading: () => null,
                            error: (_, __) => null,
                          ),
                          onTap: () async {
                            await localeNotifier.setLocale(const Locale('en'));
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        ListTile(
                          title: const Text('日本語'),
                          trailing: localeState.when(
                            data: (locale) => locale.languageCode == 'ja'
                                ? const Icon(Icons.check, color: Colors.green)
                                : null,
                            loading: () => null,
                            error: (_, __) => null,
                          ),
                          onTap: () async {
                            await localeNotifier.setLocale(const Locale('ja'));
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(l10n.settingsNotifications),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现通知设置
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: Text(l10n.settingsTheme),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现主题设置
            },
          ),
          ListTile(
            leading: const Icon(Icons.volume_up),
            title: Text(l10n.settingsSound),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现声音设置
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(l10n.settingsAbout),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现关于页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: Text(l10n.settingsPrivacy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现隐私政策页面
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text(l10n.settingsTerms),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 实现使用条款页面
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              l10n.settingsLogout,
              style: const TextStyle(color: Colors.red),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(l10n.settingsConfirmLogout),
                  content: Text(l10n.settingsLogoutMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(l10n.settingsCancel),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await authNotifier.signOut();
                        if (context.mounted) {
                          context.go('/auth');
                        }
                      },
                      child: Text(l10n.settingsConfirm),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${l10n.settingsVersion}: 1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
