import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllQuestionsUseCase
    extends UseCasePram<List<QuestionsEntity>, String> {
  QuestionsRepo questionsRepo;
  GetAllQuestionsUseCase({required this.questionsRepo});

  @override
  Future<Either<List<QuestionsEntity>, Failure>> call(pram) async {
    return await questionsRepo.getAllQuestionsOnExam(examId: pram);
  }
}
