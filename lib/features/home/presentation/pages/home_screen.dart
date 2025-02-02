import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_app/features/paper/presentation/providers/paper_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JLPT Study'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int grade = 1; grade <= 6; grade++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'N$grade',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                _PaperList(grade: grade),
                const SizedBox(height: 16),
              ],
            ),
        ],
      ),
    );
  }
}

class _PaperList extends ConsumerWidget {
  const _PaperList({
    required this.grade,
  });

  final int grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final papersAsync = ref.watch(paperProvider);

    return papersAsync.when(
      data: (papers) {
        final levelPapers = papers.where((p) => p.grade == grade).toList();
        if (levelPapers.isEmpty) {
          return const Center(
            child: Text('暂无试卷'),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: levelPapers.length,
          itemBuilder: (context, index) {
            final paper = levelPapers[index];
            return Card(
              child: ListTile(
                title: Text(paper.name),
                subtitle: Text('时长: ${paper.time ?? 0}分钟'),
                trailing: paper.isLock
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.chevron_right),
                onTap: () {
                  if (!paper.isLock) {
                    context.go('/paper/${paper.paperId}');
                  }
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('加载失败: $error'),
      ),
    );
  }
}
