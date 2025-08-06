import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveExamResultUseCase extends UseCasePram<void, List<ExamInfoModel>> {
  final QuestionsRepo questionsRepo;

  SaveExamResultUseCase({required this.questionsRepo});
  @override
  Future<Either<void, Failure>> call(pram) async {
    return await questionsRepo.saveExamResult(examInfo: pram);
  }
}
