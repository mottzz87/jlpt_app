import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/paper.dart';
import '../providers/paper_provider.dart';

class PaperScreen extends ConsumerWidget {
  const PaperScreen({
    super.key,
    required this.paperId,
  });

  final int paperId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final papersAsync = ref.watch(paperProvider);

    return papersAsync.when(
      data: (papers) {
        final paper = papers.firstWhere(
          (p) => p.paperId == paperId,
          orElse: () => throw Exception('试卷不存在'),
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(paper.name),
            actions: [
              IconButton(
                onPressed: () => context.go('/exam/$paperId'),
                icon: const Icon(Icons.play_arrow),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PaperInfo(paper: paper),
                const SizedBox(height: 24),
                _StartExamButton(paperId: paperId),
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('加载失败: $error'),
        ),
      ),
    );
  }
}

class _PaperInfo extends StatelessWidget {
  const _PaperInfo({
    required this.paper,
  });

  final Paper paper;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '试卷信息',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _InfoItem(
              icon: Icons.timer,
              label: '考试时长',
              value: '${paper.time ?? 0}分钟',
            ),
            if (paper.hearingTime != null) ...[
              const SizedBox(height: 8),
              _InfoItem(
                icon: Icons.headphones,
                label: '听力时长',
                value: '${paper.hearingTime}分钟',
              ),
            ],
            const SizedBox(height: 8),
            _InfoItem(
              icon: Icons.score,
              label: '总分',
              value: '${paper.score ?? 180}分',
            ),
            const SizedBox(height: 8),
            _InfoItem(
              icon: Icons.lock,
              label: '状态',
              value: paper.isLock ? '已锁定' : '可用',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(label),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _StartExamButton extends StatelessWidget {
  const _StartExamButton({
    required this.paperId,
  });

  final int paperId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.icon(
        onPressed: () => context.go('/exam/$paperId'),
        icon: const Icon(Icons.play_arrow),
        label: const Text('开始考试'),
      ),
    );
  }
}
