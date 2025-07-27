import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';

abstract class ExamRepository {
  Future<Either<Failure, ExamEntity>> getAllExamsOnSubject(String subjectId);
}
