
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';

abstract class QuestionsDataSource {
  Future<QuestionsEntity> getAllQuestionsOnExam(String examId);
}
