import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/repository/questions_repo_impl.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllQuestionsUseCase {
  QuestionsRepoImpl questionsRepoImpl;
  GetAllQuestionsUseCase({required this.questionsRepoImpl});

  Future<Either<Failure, QuestionsEntity>> execute(examId) async {
    return await questionsRepoImpl.getAllQuestionsOnExam(examId);
  }
}
