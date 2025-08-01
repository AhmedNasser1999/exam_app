import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';

abstract class QuestionsRepo {
  Future<Either<List<QuestionsEntity>, Failure >> getAllQuestionsOnExam({required  String examId});
  Future<String> getToken({required String tokenKey});
}
