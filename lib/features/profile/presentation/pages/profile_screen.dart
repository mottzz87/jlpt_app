import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jlpt_app/core/theme/theme_utils.dart';
import 'package:jlpt_app/features/profile/presentation/providers/user_provider.dart';
import 'package:jlpt_app/features/settings/presentation/widgets/settings_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final userState = ref.watch(userProvider);
    final textColor = ThemeUtils.getTextColor(isDark);

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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(20),
                  child: userState.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    data: (user) => Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: user?.userMetadata?['avatar_url'] !=
                                  null
                              ? NetworkImage(user!.userMetadata!['avatar_url'])
                              : null,
                          backgroundColor: Colors.blue.withOpacityValue(0.1),
                          child: user?.userMetadata?['avatar_url'] == null
                              ? Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.blue.shade400,
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.email ?? l10n.profileNotSet,
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'ID: ${user?.id ?? l10n.profileNotSet}',
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 16,
                                  opacity: 0.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, bottom: 8),
                  child: Text(
                    '',
                    style: ThemeUtils.getTextStyle(
                      isDark: isDark,
                      opacity: 0.6,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacityValue(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.blue.shade400,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    l10n.profileStudyTime,
                                    style: ThemeUtils.getTextStyle(
                                      isDark: isDark,
                                      fontSize: 12,
                                      opacity: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '12.5h',
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacityValue(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green.shade400,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    l10n.profileTasks,
                                    style: ThemeUtils.getTextStyle(
                                      isDark: isDark,
                                      fontSize: 14,
                                      opacity: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '256',
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacityValue(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple.shade400,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    l10n.profilePoints,
                                    style: ThemeUtils.getTextStyle(
                                      isDark: isDark,
                                      fontSize: 14,
                                      opacity: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '1,280',
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacityValue(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department,
                                    color: Colors.orange.shade400,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    l10n.profileStreak,
                                    style: ThemeUtils.getTextStyle(
                                      isDark: isDark,
                                      fontSize: 14,
                                      opacity: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '7',
                                style: ThemeUtils.getTextStyle(
                                  isDark: isDark,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, bottom: 8),
                  child: Text(
                    '',
                    style: ThemeUtils.getTextStyle(
                      isDark: isDark,
                      opacity: 0.6,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: ThemeUtils.getContainerDecoration(isDark: isDark),
                  child: Column(
                    children: [
                      userState.when(
                        data: (user) => Column(
                          children: [
                            SettingItem(
                              title: l10n.profileUsername,
                              icon: Icons.person,
                              iconColor: Colors.blue.shade400,
                              // subtitle: user.username,
                              isFirst: true,
                              onTap: () {},
                            ),
                            SettingItem(
                              title: l10n.profileEmail,
                              icon: Icons.email,
                              iconColor: Colors.green.shade400,
                              // subtitle: user.email,
                              onTap: () {},
                            ),
                            SettingItem(
                              title: l10n.profilePhone,
                              icon: Icons.phone,
                              iconColor: Colors.orange.shade400,
                              // subtitle: user.phone ?? l10n.profileNotSet,
                              isLast: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (_, __) => Center(
                          child: Text(l10n.profileError),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 180),
              ],
            ),
          ),
        ));
  }
}
