class ExamEntity {
  final String id;
  final String title;
  final int duration;
  final String subjectId;
  final int numberOfQuestions;
  final bool isActive;
  final DateTime createdAt;

  ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.subjectId,
    required this.numberOfQuestions,
    required this.isActive,
    required this.createdAt,
  });
}
