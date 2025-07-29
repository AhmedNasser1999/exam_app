import 'package:exam_app/features/home/sections/explore/exams/api/client/exam_api_client.dart';
import 'package:exam_app/features/home/sections/explore/exams/data/data_source/exam_data_source.dart';
import 'package:exam_app/features/home/sections/explore/exams/data/models/exams_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamDataSource)
class ExamDataSourceImpl implements ExamDataSource {
  ExamApiClient examApiClient;
  ExamDataSourceImpl({required this.examApiClient});
  @override
  Future<ExamResponse> getAllExamsOnSubject({
    required String subjectId,
    required String token,
  }) async {
    return await examApiClient.fetchExamsBySubject(subjectId, token);
  }
}
