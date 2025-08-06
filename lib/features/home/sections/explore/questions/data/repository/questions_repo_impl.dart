
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/data_source/questions_data_source.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
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
  Future<Either<List<QuestionsEntity>, Failure>> getAllQuestionsOnExam({
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
      return left(response.questions);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<String> getToken({required String tokenKey}) {
    final userToken = userTokenStorage.getToken(tokenKey: tokenKey);
    return userToken;
  }

  @override
  Future<Either<ResultEntity, Failure>> checkQuestionsOnExam({
    required ExamSubmitRequestModel question,
  }) async {
    try {
      final String token = await getToken(tokenKey: Constant.userToken);
      final response = await questionsDataSource.checkQuestionsOnExam(
        token: token,
        question: question,
      );
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> saveExamResult({
    required ExamInfoModel examInfo,
  }) async {
    try {
      await resultExamLocal.saveExamResult(examInfo: examInfo);
      return left(null);
    } catch (e) {
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }
}
