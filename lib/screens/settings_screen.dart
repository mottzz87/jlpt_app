import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/theme_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../widgets/settings_item.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _showLanguageSettings(
    BuildContext context,
    AsyncValue<Locale> localeState,
    LocaleNotifier localeNotifier,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = ThemeUtils.getTextColor(isDark);
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) => BottomSheetContent(
        title: l10n.settingsLanguage,
        children: [
          ListTile(
            title: Text(
              '简体中文',
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: localeState.when(
              data: (locale) => locale.languageCode == 'zh'
                  ? Icon(
                      Icons.check_circle,
                      color: textColor.withOpacity(0.6),
                    )
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
          ThemeUtils.getDivider(isDark),
          ListTile(
            title: Text(
              'English',
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: localeState.when(
              data: (locale) => locale.languageCode == 'en'
                  ? Icon(
                      Icons.check_circle,
                      color: textColor.withOpacity(0.6),
                    )
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
          ThemeUtils.getDivider(isDark),
          ListTile(
            title: Text(
              '日本語',
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: localeState.when(
              data: (locale) => locale.languageCode == 'ja'
                  ? Icon(
                      Icons.check_circle,
                      color: textColor.withOpacity(0.6),
                    )
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
  }

  void _showThemeSettings(
    BuildContext context,
    ThemeMode themeMode,
    ThemeNotifier themeNotifier,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = ThemeUtils.getTextColor(isDark);
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) => BottomSheetContent(
        title: l10n.settingsTheme,
        children: [
          ListTile(
            leading: Icon(
              Icons.light_mode,
              color: textColor.withOpacity(0.6),
            ),
            title: Text(
              l10n.settingsThemeLight,
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: themeMode == ThemeMode.light
                ? Icon(
                    Icons.check_circle,
                    color: textColor.withOpacity(0.6),
                  )
                : null,
            onTap: () {
              themeNotifier.setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
          ),
          ThemeUtils.getDivider(isDark),
          ListTile(
            leading: Icon(
              Icons.dark_mode,
              color: textColor.withOpacity(0.6),
            ),
            title: Text(
              l10n.settingsThemeDark,
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: themeMode == ThemeMode.dark
                ? Icon(
                    Icons.check_circle,
                    color: textColor.withOpacity(0.6),
                  )
                : null,
            onTap: () {
              themeNotifier.setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
          ThemeUtils.getDivider(isDark),
          ListTile(
            leading: Icon(
              Icons.brightness_auto,
              color: textColor.withOpacity(0.6),
            ),
            title: Text(
              l10n.settingsThemeSystem,
              style: ThemeUtils.getTextStyle(isDark: isDark),
            ),
            trailing: themeMode == ThemeMode.system
                ? Icon(
                    Icons.check_circle,
                    color: textColor.withOpacity(0.6),
                  )
                : null,
            onTap: () {
              themeNotifier.setThemeMode(ThemeMode.system);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final authNotifier = ref.read(authProvider.notifier);
    final localeNotifier = ref.read(localeProvider.notifier);
    final localeState = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: ThemeUtils.getBackgroundColor(isDark),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Text(
                  l10n.settingsGeneral,
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    opacity: 0.6,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ThemeUtils.getContainerDecoration(isDark: isDark),
                child: Column(
                  children: [
                    SettingItem(
                      title: l10n.settingsLanguage,
                      subtitle: localeState.when(
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
                        loading: () => l10n.settingsLoading,
                        error: (_, __) => l10n.settingsError,
                      ),
                      isFirst: true,
                      onTap: () => _showLanguageSettings(
                        context,
                        localeState,
                        localeNotifier,
                      ),
                    ),
                    SettingItem(
                      title: l10n.settingsTheme,
                      subtitle: themeMode == ThemeMode.light
                          ? l10n.settingsThemeLight
                          : themeMode == ThemeMode.dark
                              ? l10n.settingsThemeDark
                              : l10n.settingsThemeSystem,
                      onTap: () => _showThemeSettings(
                        context,
                        themeMode,
                        themeNotifier,
                      ),
                    ),
                    SettingItem(
                      title: l10n.settingsNotifications,
                      subtitle: l10n.settingsNotificationDesc,
                      onTap: () {
                        // TODO: 实现通知设置
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsSound,
                      subtitle: l10n.settingsSoundDesc,
                      isLast: true,
                      onTap: () {
                        // TODO: 实现声音设置
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
                child: Text(
                  l10n.settingsHelp,
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    opacity: 0.6,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ThemeUtils.getContainerDecoration(isDark: isDark),
                child: Column(
                  children: [
                    SettingItem(
                      title: l10n.settingsAbout,
                      isFirst: true,
                      onTap: () {
                        // TODO: 实现关于页面
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsPrivacy,
                      onTap: () {
                        // TODO: 实现隐私政策页面
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsTerms,
                      isLast: true,
                      onTap: () {
                        // TODO: 实现使用条款页面
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ThemeUtils.getContainerDecoration(isDark: isDark),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.red.withOpacity(0.8),
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              l10n.settingsLogout,
                              style: ThemeUtils.getTextStyle(
                                isDark: isDark,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '${l10n.settingsVersion}: 1.0.0',
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    opacity: 0.4,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BottomSheetContent({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding + bottomSafeArea),
      decoration: ThemeUtils.getContainerDecoration(
        isDark: isDark,
        borderRadius: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: ThemeUtils.getTextColor(isDark).withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  title,
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
