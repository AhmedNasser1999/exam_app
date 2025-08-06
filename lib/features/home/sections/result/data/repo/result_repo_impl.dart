import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/result/data/data_source/result_data_source_local.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:exam_app/features/home/sections/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResultRepo)
class ResultRepoImpl extends ResultRepo {
  final ResultDataSourceLocal resultDataSourceLocal;

  ResultRepoImpl({required this.resultDataSourceLocal});
  @override
  Future<Either<List<ExamInfoModel>, Failure>> getAllResult() async {
    try {
      final allResult = await resultDataSourceLocal.getAllResultExam();
      return left(allResult);
    } on Exception catch (e) {
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }
}
