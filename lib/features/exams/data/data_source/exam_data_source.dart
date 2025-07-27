import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';

abstract class ExamDataSource {
  Future<ExamEntity> getAllExamsOnSubject(String subjectId);
}
