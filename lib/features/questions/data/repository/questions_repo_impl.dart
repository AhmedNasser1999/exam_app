import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/questions/api/data_source/questions_data_source_impl.dart';
import 'package:exam_app/features/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/questions/domain/repository/questions_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class QuestionsRepoImpl implements QuestionsRepo {
  QuestionsDataSourceImpl questionsDataSourceImpl;
  QuestionsRepoImpl({required this.questionsDataSourceImpl});
  @override
  Future<Either<Failure, QuestionsEntity>> getAllQuestionsOnExam(examId) async {
    try {
      final question = await questionsDataSourceImpl.getAllQuestionsOnExam(
        examId,
      );
      return Right(
        QuestionsEntity(
          id: question.id,
          question: question.question,
          type: question.type,
          correctAnswerKey: question.correctAnswerKey,
          answer: question.answer,
          key: question.key,
          title: question.title,
          duration: question.duration,
          subject: question.subject,
          numberOfQuestions: question.numberOfQuestions,
          active: question.active,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
