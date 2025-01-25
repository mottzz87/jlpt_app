import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/database_service.dart';

final databaseProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final paperRepositoryProvider = Provider((ref) {
  final database = ref.watch(databaseProvider);
  return database.paperRepository;
});

final userRepositoryProvider = Provider((ref) {
  final database = ref.watch(databaseProvider);
  return database.userRepository;
});
