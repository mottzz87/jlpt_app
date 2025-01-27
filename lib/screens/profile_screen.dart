import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../providers/user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    // 定义温暖的颜色
    final warmPrimary = const Color(0xFFE8998D);
    final warmSecondary = const Color(0xFFEDB183);
    final warmBackground = const Color(0xFFFFF5EC);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: warmBackground.withOpacity(0.3),
        ),
        child: userAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('加载失败: $error'),
          ),
          data: (supabase.User? user) {
            if (user == null) {
              return const Center(
                child: Text('未登录'),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 用户头像和基本信息
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: warmPrimary.withOpacity(0.1),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: warmPrimary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: warmPrimary.withOpacity(0.3),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: warmPrimary.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  user.userMetadata?['avatar_url'] != null
                                      ? NetworkImage(
                                          user.userMetadata!['avatar_url'])
                                      : null,
                              backgroundColor: warmPrimary.withOpacity(0.1),
                              child: user.userMetadata?['avatar_url'] == null
                                  ? Icon(Icons.person,
                                      size: 40, color: warmPrimary)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.email ?? l10n.profileEmailNotSet,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: warmPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'ID: ${user.id}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: warmPrimary.withOpacity(0.7),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 统计信息
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: warmSecondary.withOpacity(0.1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: warmSecondary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStat(
                            context,
                            Icons.star_rounded,
                            '0',
                            l10n.profileFreeExams,
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: warmSecondary.withOpacity(0.2),
                          ),
                          _buildStat(
                            context,
                            Icons.task_alt_rounded,
                            '0',
                            l10n.profileCompletedExams,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 设置选项
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: warmPrimary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: warmPrimary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.school_rounded,
                                color: warmPrimary,
                              ),
                            ),
                            title: Text(
                              l10n.profileLearnMore,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: warmPrimary.withOpacity(0.8),
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: warmPrimary,
                            ),
                            onTap: () {
                              // TODO: 导航到语言设置
                            },
                          ),
                          Divider(
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                            color: warmPrimary.withOpacity(0.1),
                          ),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: warmPrimary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.notifications_rounded,
                                color: warmPrimary,
                              ),
                            ),
                            title: Text(
                              l10n.settingsNotifications,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: warmPrimary.withOpacity(0.8),
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: warmPrimary,
                            ),
                            onTap: () {
                              // TODO: 导航到通知设置
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStat(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    final warmSecondary = const Color(0xFFEDB183);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: warmSecondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: warmSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 28,
            color: warmSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: warmSecondary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: warmSecondary.withOpacity(0.8),
              ),
        ),
      ],
    );
  }
}
