import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/paper.dart';
import '../models/question.dart';
import '../repositories/paper_repository.dart';
import 'database_provider.dart';

class PaperNotifier extends StateNotifier<AsyncValue<List<Paper>>> {
  final PaperRepository _repository;

  PaperNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadPapers();
  }

  Future<void> loadPapers() async {
    state = const AsyncValue.loading();
    try {
      final papers = await _repository.getAllPapers();
      if (!mounted) return;
      state = AsyncValue.data([...papers]);
    } catch (error, stackTrace) {
      if (!mounted) return;
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadPapers();
  }

  Future<void> loadPapersByGrade(int grade) async {
    state = const AsyncValue.loading();
    try {
      final papers = await _repository.getPapersByGrade(grade);
      if (!mounted) return;
      state = AsyncValue.data([...papers]);
    } catch (error, stackTrace) {
      if (!mounted) return;
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<Paper?> getPaper(int paperId) async {
    try {
      return await _repository.getPaper(paperId);
    } catch (error) {
      return null;
    }
  }

  Future<List<Question>> getQuestions(int paperId) async {
    try {
      return await _repository.getQuestions(paperId);
    } catch (error) {
      return [];
    }
  }

  Future<List<QuestionOption>> getQuestionOptions(int questionId) async {
    try {
      return await _repository.getQuestionOptions(questionId);
    } catch (error) {
      return [];
    }
  }
}

final paperProvider =
    StateNotifierProvider<PaperNotifier, AsyncValue<List<Paper>>>((ref) {
  final repository = ref.watch(paperRepositoryProvider);
  return PaperNotifier(repository);
});

final selectedPaperProvider = StateProvider<Paper?>((ref) => null);

final selectedQuestionProvider = StateProvider<Question?>((ref) => null);

final levelTitlesProvider = StateProvider<Map<int, String>>((ref) => {
      1: '初级 N5',
      2: '初级 N4',
      3: '中级 N3',
      4: '中高级 N2',
      5: '高级 N1',
    });
