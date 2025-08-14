import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';

abstract class ExamRepository {
  Future<ApiResult< List<ExamEntity>>> getAllExamsOnSubject(String subjectId);
}
