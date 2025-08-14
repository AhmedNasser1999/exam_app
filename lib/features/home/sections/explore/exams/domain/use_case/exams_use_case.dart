import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';

import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllExamsByIdUseCase extends UseCasePram<List<ExamEntity>, String> {
  final ExamRepository examsRepoImpl;

  AllExamsByIdUseCase({required this.examsRepoImpl});
  @override
  Future<ApiResult<List<ExamEntity>>> call(pram) async {
    return await examsRepoImpl.getAllExamsOnSubject(pram);
  }
}
