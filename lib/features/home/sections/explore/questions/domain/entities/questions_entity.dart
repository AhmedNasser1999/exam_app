
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';

class QuestionsEntity {
  final String question;
  final String type;
  final String correctAnswerKey;
  final List<AnswerEntity> answer;

  QuestionsEntity({
    required this.question,
    required this.type,
    required this.correctAnswerKey,
    required this.answer,
  });
}
