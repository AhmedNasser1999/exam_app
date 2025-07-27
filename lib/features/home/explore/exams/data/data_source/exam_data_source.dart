import 'package:exam_app/features/home/explore/exams/domain/entities/exam_entity.dart';

abstract class ExamDataSource {
  Future<ExamEntity> getAllExamsOnSubject(String subjectId);
}
