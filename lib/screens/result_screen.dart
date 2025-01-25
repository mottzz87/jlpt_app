import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import '../models/paper.dart';
import '../providers/exam_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
    required this.paperId,
  });

  final String paperId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examProvider);
    final paper = examState.paper;

    if (paper == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(paper.name),
        actions: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ScoreCard(
              score: 150,
              totalScore: paper.score ?? 180,
            ),
            const SizedBox(height: 24),
            _ScoreBreakdown(),
            const SizedBox(height: 24),
            _AnswerAnalysis(),
          ],
        ),
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({
    required this.score,
    required this.totalScore,
  });

  final int score;
  final int totalScore;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final percentage = score / totalScore;
    final isPassed = percentage >= 0.6;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '总分',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$score/$totalScore',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isPassed
                        ? colorScheme.primary.withOpacity(0.1)
                        : colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isPassed ? '通过' : '未通过',
                    style: TextStyle(
                      color: isPassed ? colorScheme.primary : colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: colorScheme.primary.withOpacity(0.1),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text(
              '得分率：${(percentage * 100).toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideY();
  }
}

class _ScoreBreakdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '分数明细',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            const _ScoreBreakdownItem(
              title: '词汇语法',
              score: 45,
              totalScore: 60,
            ),
            const SizedBox(height: 12),
            const _ScoreBreakdownItem(
              title: '阅读理解',
              score: 55,
              totalScore: 60,
            ),
            const SizedBox(height: 12),
            const _ScoreBreakdownItem(
              title: '听力理解',
              score: 50,
              totalScore: 60,
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideY();
  }
}

class _ScoreBreakdownItem extends StatelessWidget {
  const _ScoreBreakdownItem({
    required this.title,
    required this.score,
    required this.totalScore,
  });

  final String title;
  final int score;
  final int totalScore;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final percentage = score / totalScore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              '$score/$totalScore',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: colorScheme.primary.withOpacity(0.1),
          minHeight: 4,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}

class _AnswerAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '答题分析',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            const _AnswerAnalysisItem(
              questionNumber: 1,
              isCorrect: true,
              answer: 'A',
              correctAnswer: 'A',
              explanation: 'JLPTは1984年から実施されているという記述は正しいです。',
            ),
            const SizedBox(height: 12),
            const _AnswerAnalysisItem(
              questionNumber: 2,
              isCorrect: false,
              answer: 'B',
              correctAnswer: 'A',
              explanation: 'JLPTは日本語を母語としない人のための試験です。',
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideY();
  }
}

class _AnswerAnalysisItem extends StatelessWidget {
  const _AnswerAnalysisItem({
    required this.questionNumber,
    required this.isCorrect,
    required this.answer,
    required this.correctAnswer,
    required this.explanation,
  });

  final int questionNumber;
  final bool isCorrect;
  final String answer;
  final String correctAnswer;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect
            ? colorScheme.primary.withOpacity(0.1)
            : colorScheme.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCorrect ? colorScheme.primary : colorScheme.error,
                ),
                child: Icon(
                  isCorrect ? Icons.check : Icons.close,
                  size: 16,
                  color: colorScheme.onPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '第$questionNumber题',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color:
                          isCorrect ? colorScheme.primary : colorScheme.error,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '你的答案：',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(width: 4),
              Text(
                answer,
                style: TextStyle(
                  color: isCorrect ? colorScheme.primary : colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isCorrect) ...[
                const SizedBox(width: 16),
                Text(
                  '正确答案：',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(width: 4),
                Text(
                  correctAnswer,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            explanation,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
