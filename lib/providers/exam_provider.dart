import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import 'paper_provider.dart';
import 'user_provider.dart';

class ExamState {
  final Paper? paper;
  final List<Question> questions;
  final Map<int, String> answers;
  final int currentQuestionIndex;
  final bool isLoading;
  final String? error;
  final int remainingTime;
  final bool isFinished;

  const ExamState({
    this.paper,
    this.questions = const [],
    this.answers = const {},
    this.currentQuestionIndex = 0,
    this.isLoading = false,
    this.error,
    this.remainingTime = 0,
    this.isFinished = false,
  });

  ExamState copyWith({
    Paper? paper,
    List<Question>? questions,
    Map<int, String>? answers,
    int? currentQuestionIndex,
    bool? isLoading,
    String? error,
    int? remainingTime,
    bool? isFinished,
  }) {
    return ExamState(
      paper: paper ?? this.paper,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      remainingTime: remainingTime ?? this.remainingTime,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}

class ExamNotifier extends StateNotifier<ExamState> {
  final PaperNotifier _paperNotifier;
  final UserNotifier _userNotifier;
  Timer? _timer;

  ExamNotifier(this._paperNotifier, this._userNotifier)
      : super(const ExamState());

  Future<void> startExam(int paperId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final paper = await _paperNotifier.getPaper(paperId);
      if (paper == null) {
        state = state.copyWith(
          isLoading: false,
          error: '试卷不存在',
        );
        return;
      }

      final questions = await _paperNotifier.getQuestions(paperId);
      if (questions.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: '试卷题目为空',
        );
        return;
      }

      // 加载已保存的答案
      final savedAnswers = await _userNotifier.getAnswers(paperId);
      final answers = <int, String>{};
      for (final answer in savedAnswers) {
        if (answer.selectedAnswer != null) {
          answers[answer.questionId] = answer.selectedAnswer!;
        }
      }

      state = state.copyWith(
        paper: paper,
        questions: questions,
        answers: answers,
        remainingTime: paper.time ?? 0,
        isLoading: false,
      );

      // 启动计时器
      _startTimer();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (state.remainingTime <= 0) {
        submitExam();
        return;
      }
      state = state.copyWith(remainingTime: state.remainingTime - 1);
    });
  }

  void selectAnswer(String answer) {
    if (state.isFinished) return;

    final questionId = state.questions[state.currentQuestionIndex].questionId;
    final answers = Map<int, String>.from(state.answers);
    answers[questionId] = answer;

    state = state.copyWith(answers: answers);

    // 保存答案
    _saveAnswer(questionId, answer);
  }

  Future<void> _saveAnswer(int questionId, String answer) async {
    if (state.paper == null) return;

    final userAnswer = UserAnswer()
      ..userId = _userNotifier.state.user!.userId
      ..paperId = state.paper!.paperId
      ..questionId = questionId
      ..selectedAnswer = answer
      ..answerTime = DateTime.now();

    await _userNotifier.saveAnswer(userAnswer);
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
      );
    }
  }

  void previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
      );
    }
  }

  Future<void> submitExam() async {
    if (state.paper == null) return;

    state = state.copyWith(isLoading: true);

    try {
      // 计算得分
      var totalScore = 0;
      var correctCount = 0;

      for (final question in state.questions) {
        final answer = state.answers[question.questionId];
        if (answer != null && answer == question.answer) {
          totalScore += (question.score ?? 0).round();
          correctCount++;
        }
      }

      // 保存进度
      final progress = UserProgress()
        ..userId = _userNotifier.state.user!.userId
        ..paperId = state.paper!.paperId
        ..typeId = state.paper!.grade
        ..score = totalScore.toDouble()
        ..isFinish = true
        ..time = state.paper!.time! - state.remainingTime
        ..correctPercent = correctCount / state.questions.length;

      await _userNotifier.saveProgress(progress);

      state = state.copyWith(
        isFinished: true,
        isLoading: false,
      );

      _timer?.cancel();
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final examProvider = StateNotifierProvider<ExamNotifier, ExamState>((ref) {
  final paperNotifier = ref.watch(paperProvider.notifier);
  final userNotifier = ref.watch(userProvider.notifier);
  return ExamNotifier(paperNotifier, userNotifier);
});
