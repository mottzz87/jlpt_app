import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/paper.dart';

final paperProvider = FutureProvider<List<Paper>>((ref) async {
  // TODO: 从数据源获取试卷数据
  return [];
});
