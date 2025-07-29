import 'package:dartz/dartz.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/explore/exams/data/data_source/exam_data_source.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamRepository)
class ExamsRepoImpl implements ExamRepository {
  final ExamDataSource examDataSource;
  final UserTokenStorage userTokenStorage;
  ExamsRepoImpl({required this.examDataSource, required this.userTokenStorage});
  @override
  Future<Either<Failure, List<ExamEntity>>> getAllExamsOnSubject(
    String subjectId,
  ) async {
    try {
      final token = await getToken();
      final allExam = await examDataSource.getAllExamsOnSubject(
        subjectId: subjectId,
        token: token,
      );

      return Right(allExam.exams);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<String> getToken() async {
    final String? token = await userTokenStorage.getToken(
      tokenKey: Constant.userToken,
    );
    return token ?? "";
  }
}
