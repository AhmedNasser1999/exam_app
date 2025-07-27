import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/questions/domain/entities/questions_entity.dart';

abstract class QuestionsRepo {
  Future<Either<Failure, QuestionsEntity>> getAllQuestionsOnExam(String examId);
}
