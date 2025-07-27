import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';

abstract class ExamDataSource {
  Future<ExamEntity> getAllExamsOnSubject(String subjectId);
}
