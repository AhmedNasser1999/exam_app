import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';

abstract class QuestionsRepo {
  Future<ApiResult<List<QuestionsEntity>>> getAllQuestionsOnExam({
    required String examId,
  });
  Future<ApiResult<ResultEntity>> checkQuestionsOnExam({
    required Map<String, AnswerSubmitRequestModel> question,
  });
  Future<ApiResult<void>> saveExamResult({required ExamInfoEntity examInfo});
  Future<String> getToken({required String tokenKey});
}
