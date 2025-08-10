import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/repository/questions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckQuestionsOnExamUseCase
    extends UseCasePram<ResultEntity, Map<String, AnswerSubmitRequestModel>> {
  final QuestionsRepo questionsRepo;
  CheckQuestionsOnExamUseCase({required this.questionsRepo});

  @override
  Future<Either<ResultEntity, Failure>> call(pram) async {
    return await questionsRepo.checkQuestionsOnExam(question: pram);
  }
}
