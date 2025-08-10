import 'package:exam_app/features/home/sections/explore/questions/api/client/questions_api_client.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/data_source/questions_data_source.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/questions_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_result_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionsDataSource)
class QuestionsDataSourceImpl extends QuestionsDataSource {
  final QuestionsApiClient questionsApiClient;
  QuestionsDataSourceImpl({required this.questionsApiClient});
  @override
  Future<QuestionResponse> getAllQuestionsOnExam({
    required String examId,
    required String token,
  }) async {
    return await questionsApiClient.getAllQuestionsOnExam(
      examId: examId,
      token: token,
    );
  }

  @override
  Future<ExamResultResponseModel> checkQuestionsOnExam({
    required String token,
    required ExamSubmitRequestModel question,
  }) async {
    return await questionsApiClient.checkQuestionsOnExam(
      token: token,
      question: question,
    );
  }
}
