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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.profileTitle),
      ),
      body: userAsync.when(
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
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: user.userMetadata?['avatar_url'] !=
                                  null
                              ? NetworkImage(user.userMetadata!['avatar_url'])
                              : null,
                          child: user.userMetadata?['avatar_url'] == null
                              ? const Icon(Icons.person, size: 40)
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.email ?? l10n.profileEmailNotSet,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'ID: ${user.id}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
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
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                          height: 40,
                          width: 1,
                          color: Theme.of(context).dividerColor,
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
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.school_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(l10n.profileLearnMore),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // TODO: 导航到语言设置
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(l10n.settingsNotifications),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // TODO: 导航到通知设置
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}
