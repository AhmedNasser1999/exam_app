import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/explore/subjects/data/data_source/subject_data_source.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectRepository)
class SubjectRepoImpl implements SubjectRepository {
  final SubjectDataSource subjectDataSourceImpl;
  final UserTokenStorage userTokenStorage;
  SubjectRepoImpl({
    required this.subjectDataSourceImpl,
    required this.userTokenStorage,
  });

  @override
  Future<ApiResult<List<SubjectEntity>>> fetchSubjects() async {
    try {
      final token = await userTokenStorage.getToken(
        tokenKey: Constant.userToken,
      );
      final response = await subjectDataSourceImpl.fetchSubjects(token: token);

      return SuccessApiResult<List<SubjectEntity>>(data: response.subjects);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<List<SubjectEntity>>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<List<SubjectEntity>>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
