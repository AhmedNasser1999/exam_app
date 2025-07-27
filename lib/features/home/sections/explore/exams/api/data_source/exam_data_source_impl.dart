import 'package:exam_app/features/home/sections/explore/exams/api/client/exam_api_client.dart';
import 'package:exam_app/features/home/sections/explore/exams/data/data_source/exam_data_source.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExamDataSourceImpl implements ExamDataSource {
  ExamApiClient examApiClient;
  ExamDataSourceImpl({required this.examApiClient});
  @override
  Future<ExamEntity> getAllExamsOnSubject(String subjectId) async {
    return await examApiClient.fetchExamsBySubject(subjectId);
  }
}
