class Paper {
  final String paperId;
  final String name;
  final int grade;
  final int? time;
  final bool isLock;

  Paper({
    required this.paperId,
    required this.name,
    required this.grade,
    this.time,
    this.isLock = false,
  });
}
