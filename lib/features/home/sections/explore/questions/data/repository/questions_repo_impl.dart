import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/data_source/questions_data_source.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsDataSource questionsDataSource;
  final UserTokenStorage userTokenStorage;
  final ResultExamLocal resultExamLocal;
  QuestionsRepoImpl({
    required this.resultExamLocal,
    required this.questionsDataSource,
    required this.userTokenStorage,
  });

  @override
  Future<ApiResult<List<QuestionsEntity>>> getAllQuestionsOnExam({
    required String examId,
  }) async {
    try {
      final String token = await userTokenStorage.getToken(
        tokenKey: Constant.userToken,
      );
      final response = await questionsDataSource.getAllQuestionsOnExam(
        examId: examId,
        token: token,
      );
      return SuccessApiResult<List<QuestionsEntity>>(data: response.questions);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<List<QuestionsEntity>>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<List<QuestionsEntity>>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<String> getToken({required String tokenKey}) {
    final userToken = userTokenStorage.getToken(tokenKey: tokenKey);
    return userToken;
  }

  @override
  Future<ApiResult<ResultEntity>> checkQuestionsOnExam({
    required Map<String, AnswerSubmitRequestModel> question,
  }) async {
    try {
      final String token = await getToken(tokenKey: Constant.userToken);
      final examSubmitRequestModel = ExamSubmitRequestModel(
        answers: _mapToListAnswerSubmitRequestModel(question: question),
        time: 0,
      );
      final response = await questionsDataSource.checkQuestionsOnExam(
        token: token,
        question: examSubmitRequestModel,
      );
      return SuccessApiResult<ResultEntity>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<ResultEntity>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<ResultEntity>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<void>> saveExamResult({
    required ExamInfoEntity examInfo,
  }) async {
    try {
      bool hasToken = await userTokenStorage.hasToken();
      if (hasToken) {
        await resultExamLocal.saveExamResult(examInfo: examInfo);
      }
      return SuccessApiResult<void>(data: null);
    } catch (e) {
      return FailureApiResult<void>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }

  List<AnswerSubmitRequestModel> _mapToListAnswerSubmitRequestModel({
    required Map<String, AnswerSubmitRequestModel> question,
  }) {
    final examSubmitRequestModel = ExamSubmitRequestModel(
      answers: question.entries.map((entry) {
        return AnswerSubmitRequestModel(
          questionId: entry.key,
          correct: entry.value.correct,
        );
      }).toList(),
      time: 0,
    );
    return examSubmitRequestModel.answers;
  }
}
