import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('语言'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // 处理语言设置
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('通知'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // 处理通知设置
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('主题'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // 处理主题设置
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('退出登录', style: TextStyle(color: Colors.red)),
            onTap: () async {
              // 显示确认对话框
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('确认退出'),
                  content: const Text('确定要退出登录吗？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child:
                          const Text('确定', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );

              if (shouldLogout == true && context.mounted) {
                try {
                  await ref.read(authProvider.notifier).signOut();
                  if (context.mounted) {
                    context.go('/auth');
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('退出登录失败: ${e.toString()}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
