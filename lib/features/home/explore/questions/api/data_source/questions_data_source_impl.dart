import 'package:exam_app/features/home/explore/questions/api/client/questions_api_client.dart';
import 'package:exam_app/features/home/explore/questions/data/data_source/questions_data_source.dart';
import 'package:exam_app/features/home/explore/questions/domain/entities/questions_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class QuestionsDataSourceImpl implements QuestionsDataSource {
  QuestionsApiClient questionsApiClient;
  QuestionsDataSourceImpl({required this.questionsApiClient});
  @override
  Future<QuestionsEntity> getAllQuestionsOnExam(String examId) async {
    return await questionsApiClient.getAllQuestinsOnExam(examId);
  }
}
