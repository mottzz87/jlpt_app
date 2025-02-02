import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jlpt_app/core/theme/theme_utils.dart';
import 'package:jlpt_app/core/theme/providers/theme_provider.dart';
import 'package:jlpt_app/core/theme/providers/locale_provider.dart';
import 'package:jlpt_app/core/widgets/bottom_sheet_content.dart';
import 'package:jlpt_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:jlpt_app/features/settings/presentation/widgets/settings_item.dart';

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
        showTitle: false,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildLanguageOption(
                  context,
                  '简体中文',
                  'zh',
                  localeState,
                  localeNotifier,
                ),
                const SizedBox(height: 6),
                _buildLanguageOption(
                  context,
                  'English',
                  'en',
                  localeState,
                  localeNotifier,
                ),
                const SizedBox(height: 6),
                _buildLanguageOption(
                  context,
                  '日本語',
                  'ja',
                  localeState,
                  localeNotifier,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String title,
    String languageCode,
    AsyncValue<Locale> localeState,
    LocaleNotifier notifier,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = ThemeUtils.getTextColor(isDark);
    final isSelected = localeState.when(
      data: (locale) => locale.languageCode == languageCode,
      loading: () => false,
      error: (_, __) => false,
    );

    // 根据语言代码获取国旗表情
    String flag = '';
    switch (languageCode) {
      case 'zh':
        flag = '🇨🇳';
        break;
      case 'en':
        flag = '🇺🇸';
        break;
      case 'ja':
        flag = '🇯🇵';
        break;
    }

    return GestureDetector(
      onTap: () async {
        await notifier.setLocale(Locale(languageCode));
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? ThemeUtils.withOpacity(textColor, 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: ThemeUtils.getTextStyle(
                  isDark: isDark,
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: textColor.withOpacityValue(0.6),
                size: 20,
              ),
          ],
        ),
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
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 8),
                child: Text(
                  l10n.settingsGeneral,
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    opacity: 0.6,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
                      icon: Icons.language,
                      iconColor: Colors.blue.shade400,
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
                      icon: Icons.dark_mode,
                      iconColor: Colors.purple.shade300,
                      subtitle: themeMode == ThemeMode.system
                          ? l10n.settingsThemeSystem
                          : themeMode == ThemeMode.dark
                              ? l10n.settingsThemeDark
                              : l10n.settingsThemeLight,
                      trailing: SizedBox(
                        width: 120,
                        height: 32,
                        child: SegmentedButton<ThemeMode>(
                          segments: const [
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.light,
                              icon: SizedBox(
                                width: 40,
                                height: 32,
                                child: Center(
                                  child: Icon(
                                    Icons.light_mode,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.dark,
                              icon: SizedBox(
                                width: 40,
                                height: 32,
                                child: Center(
                                  child: Icon(
                                    Icons.dark_mode,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            ButtonSegment<ThemeMode>(
                              value: ThemeMode.system,
                              icon: SizedBox(
                                width: 40,
                                height: 32,
                                child: Center(
                                  child: Icon(
                                    Icons.brightness_auto,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          selected: {themeMode},
                          onSelectionChanged: (Set<ThemeMode> selected) {
                            themeNotifier.setThemeMode(selected.first);
                          },
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            visualDensity: VisualDensity.compact,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return ThemeUtils.withOpacity(
                                  ThemeUtils.getTextColor(isDark),
                                  0.1,
                                );
                              }
                              return Colors.transparent;
                            }),
                            side: WidgetStateProperty.resolveWith((states) {
                              return BorderSide(
                                color: ThemeUtils.withOpacity(
                                  ThemeUtils.getTextColor(isDark),
                                  states.contains(WidgetState.selected)
                                      ? 0.2
                                      : 0.1,
                                ),
                                width: 0.5,
                              );
                            }),
                            iconSize: WidgetStateProperty.all(13),
                            minimumSize:
                                WidgetStateProperty.all(const Size(32, 24)),
                            maximumSize:
                                WidgetStateProperty.all(const Size(32, 24)),
                            animationDuration:
                                const Duration(milliseconds: 200),
                            iconColor:
                                WidgetStateProperty.resolveWith((states) {
                              return ThemeUtils.withOpacity(
                                ThemeUtils.getTextColor(isDark),
                                states.contains(WidgetState.selected)
                                    ? 0.8
                                    : 0.4,
                              );
                            }),
                          ),
                          showSelectedIcon: false,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SettingItem(
                      title: l10n.settingsNotifications,
                      icon: Icons.notifications,
                      iconColor: Colors.orange.shade400,
                      subtitle: l10n.settingsNotificationDesc,
                      onTap: () {
                        // TODO: 实现通知设置
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsSound,
                      icon: Icons.volume_up,
                      iconColor: Colors.green.shade400,
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
                padding: const EdgeInsets.only(left: 30, top: 28, bottom: 8),
                child: Text(
                  l10n.settingsHelp,
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    opacity: 0.6,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: ThemeUtils.getContainerDecoration(isDark: isDark),
                child: Column(
                  children: [
                    SettingItem(
                      title: l10n.settingsAbout,
                      icon: Icons.info,
                      iconColor: Colors.blue.shade300,
                      isFirst: true,
                      onTap: () {
                        // TODO: 实现关于页面
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsPrivacy,
                      icon: Icons.privacy_tip,
                      iconColor: Colors.teal.shade300,
                      onTap: () {
                        // TODO: 实现隐私政策页面
                      },
                    ),
                    SettingItem(
                      title: l10n.settingsTerms,
                      icon: Icons.description,
                      iconColor: Colors.indigo.shade300,
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
                            color: Colors.red.withOpacityValue(0.8),
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            l10n.settingsLogout,
                            style: ThemeUtils.getTextStyle(
                              isDark: isDark,
                              fontSize: 14,
                              color: Colors.red.withOpacityValue(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: ThemeUtils.getTextStyle(
                    isDark: isDark,
                    fontSize: 12,
                    opacity: 0.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 180),
            ],
          ),
        ),
      ),
    );
  }
}
