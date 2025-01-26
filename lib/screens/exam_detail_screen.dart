import 'package:flutter/material.dart';
import '../models/models.dart';

class ExamDetailScreen extends StatelessWidget {
  final String examId;

  const ExamDetailScreen({
    super.key,
    required this.examId,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from provider
    const Paper? paper = null;
    final List<Question> questions = [];

    if (paper == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(paper.name),
      ),
      body: Column(
        children: [
          // Exam Info
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N${paper.grade}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    if (paper.time != null)
                      Text(
                        '${paper.time} minutes',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Start exam
                  },
                  child: Text('Start Exam'),
                ),
              ],
            ),
          ),

          // Question List
          Expanded(
            child: questions.isEmpty
                ? Center(
                    child: Text('No questions found'),
                  )
                : ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(question.content),
                        trailing: question.isDone == true
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
