import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_app/features/exam/presentation/providers/exam_provider.dart';

class ExamScreen extends ConsumerWidget {
  const ExamScreen({
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
          TextButton(
            onPressed: () {
              ref.read(examProvider.notifier).submitExam();
              context.go('/result/$paperId');
            },
            child: const Text('提交'),
          ),
        ],
      ),
      body: Column(
        children: [
          _ExamTimer(),
          Expanded(
            child: PageView.builder(
              itemCount: examState.questions.length,
              onPageChanged: (index) {
                // TODO: Update current question index
              },
              itemBuilder: (context, index) {
                final question = examState.questions[index];
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '第 ${index + 1} 题',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        question.content,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      _AnswerOptions(
                        questionId: question.questionId,
                        selectedAnswer: examState.answers[question.questionId],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ExamTimer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingTime = ref.watch(examProvider).remainingTime;
    final hours = remainingTime ~/ 60;
    final minutes = remainingTime % 60;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer),
          const SizedBox(width: 8),
          Text(
            '剩余时间: ${hours > 0 ? '$hours小时' : ''}$minutes分钟',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _AnswerOptions extends ConsumerWidget {
  const _AnswerOptions({
    required this.questionId,
    this.selectedAnswer,
  });

  final int questionId;
  final String? selectedAnswer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ['A', 'B', 'C', 'D'];

    return Column(
      children: options.map((option) {
        final isSelected = selectedAnswer == option;
        return RadioListTile(
          title: Text('选项 $option'),
          value: option,
          groupValue: selectedAnswer,
          onChanged: (value) {
            if (value != null) {
              ref.read(examProvider.notifier).selectAnswer(value);
            }
          },
          selected: isSelected,
        );
      }).toList(),
    );
  }
}
