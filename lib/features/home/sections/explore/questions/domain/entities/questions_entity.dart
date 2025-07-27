class QuestionsEntity {
  final String id;
  final String question;
  final String type;
  final String correctAnswerKey;
  final String answer;
  final String key;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;

  QuestionsEntity({
    required this.id,
    required this.question,
    required this.type,
    required this.correctAnswerKey,
    required this.answer,
    required this.key,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
  });
}
