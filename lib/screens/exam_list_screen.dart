import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // TODO: Replace with actual data from provider
    final List<Paper> papers = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.examsTitle),
      ),
      body: papers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.note_alt_outlined, size: 64),
                  const SizedBox(height: 16),
                  Text(l10n.examsTodo),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: papers.length,
              itemBuilder: (context, index) {
                final paper = papers[index];
                return Card(
                  child: ListTile(
                    title: Text(paper.name),
                    subtitle: Row(
                      children: [
                        Text('N${paper.grade}'),
                        const SizedBox(width: 16),
                        if (paper.time != null)
                          Text('${paper.time} ${l10n.examsMinutes}'),
                      ],
                    ),
                    trailing: paper.isLock
                        ? const Icon(Icons.lock)
                        : const Icon(Icons.arrow_forward_ios),
                    onTap: paper.isLock
                        ? null
                        : () => context.pushNamed(
                              'exam-detail',
                              pathParameters: {'id': paper.id.toString()},
                            ),
                  ),
                );
              },
            ),
    );
  }
}
