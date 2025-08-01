class AnswerEntity {
  final String answer;
  final String key;
  bool isSelected;

  AnswerEntity({
    required this.answer,
    required this.key,
    this.isSelected = false,
  });
}
