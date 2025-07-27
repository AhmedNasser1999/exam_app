
import 'package:exam_app/features/questions/domain/entities/questions_entity.dart';

abstract class QuestionsDataSource {
  Future<QuestionsEntity> getAllQuestionsOnExam(String examId);
}
