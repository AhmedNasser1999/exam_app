import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/home/sections/result/data/model/question_info_model.dart';

class QuestionsEntity extends QuestionInfoModel {
  final String question;
  final String questionId;
  final String type;
  final String correctAnswerKey;
  final List<AnswerEntity> answer;

  QuestionsEntity({
    required this.question,
    required this.type,
    required this.questionId,
    required this.correctAnswerKey,
    required this.answer,
  }) : super(
         correct: correctAnswerKey,
         question: question,
         questionAnswer: answer,
       );
}
