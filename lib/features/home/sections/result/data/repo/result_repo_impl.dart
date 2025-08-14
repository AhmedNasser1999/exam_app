import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/result/data/data_source/result_data_source_local.dart';
import 'package:exam_app/features/home/sections/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResultRepo)
class ResultRepoImpl extends ResultRepo {
  final ResultDataSourceLocal resultDataSourceLocal;

  ResultRepoImpl({required this.resultDataSourceLocal});
  @override
  Future<ApiResult<List<ExamInfoEntity>>> getAllResult() async {
    try {
      final allResult = await resultDataSourceLocal.getAllResultExam();
      return SuccessApiResult<List<ExamInfoEntity>>(data: allResult);
    } on Exception catch (e) {
      return FailureApiResult<List<ExamInfoEntity>>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
