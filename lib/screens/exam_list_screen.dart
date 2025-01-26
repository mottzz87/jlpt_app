import 'package:flutter/material.dart';
import '../models/models.dart';

class ExamListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from provider
    final List<Paper> papers = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
      ),
      body: papers.isEmpty
          ? Center(
              child: Text('No exams found'),
            )
          : ListView.builder(
              itemCount: papers.length,
              itemBuilder: (context, index) {
                final paper = papers[index];
                return ListTile(
                  title: Text(paper.name),
                  subtitle: Text('${paper.time} minutes'),
                  onTap: () {
                    // TODO: Navigate to exam detail
                  },
                );
              },
            ),
    );
  }
}
