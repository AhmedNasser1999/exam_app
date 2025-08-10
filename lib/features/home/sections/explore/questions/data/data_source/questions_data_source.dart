import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/questions_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_result_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
abstract class QuestionsDataSource {
  Future<QuestionResponse> getAllQuestionsOnExam({
    required String examId,
    required String token,
  });
  Future<ExamResultResponseModel> checkQuestionsOnExam({
    required String token,
    required ExamSubmitRequestModel question,
  });
}
