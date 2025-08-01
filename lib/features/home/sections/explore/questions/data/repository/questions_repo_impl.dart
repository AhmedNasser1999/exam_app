import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/data_source/questions_data_source.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  QuestionsDataSource questionsDataSource;
  final UserTokenStorage userTokenStorage;
  QuestionsRepoImpl({
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
      log(response.questions.length.toString());
      return left(response.questions);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      log(e.toString());
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<String> getToken({required String tokenKey}) {
    final userToken = userTokenStorage.getToken(tokenKey: tokenKey);
    return userToken;
  }
}
