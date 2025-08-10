import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:hive/hive.dart';
part 'questions_entity.g.dart';

@HiveType(typeId: 1)
class QuestionsEntity extends HiveObject {
  @HiveField(0)
  final String questionId;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String correctAnswerKey;
  @HiveField(4)
  final List<AnswerEntity> answer;

  QuestionsEntity({
    required this.question,
    required this.type,
    required this.questionId,
    required this.correctAnswerKey,
    required this.answer,
  });
}
