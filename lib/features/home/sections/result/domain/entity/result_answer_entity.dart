class ResultAnswerEntity {
  final String answer, key, correctAnswer;
  final bool isSelected;

  ResultAnswerEntity({
    required this.answer,
    required this.key,
    required this.correctAnswer,
    required this.isSelected,
  });
}
