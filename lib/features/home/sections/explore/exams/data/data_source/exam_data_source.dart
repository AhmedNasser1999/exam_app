import 'package:exam_app/features/home/sections/explore/exams/data/models/exams_response_model.dart';

abstract class ExamDataSource {
  Future<ExamResponse> getAllExamsOnSubject({
    required String subjectId,
    required String token,
  });
}
