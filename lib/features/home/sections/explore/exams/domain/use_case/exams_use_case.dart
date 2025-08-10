import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';

import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllExamsByIdUseCase {
  final ExamRepository examsRepoImpl;

  AllExamsByIdUseCase({required this.examsRepoImpl});

  Future<Either<Failure, List<ExamEntity>>> execute(String subjectId) async {
    return await examsRepoImpl.getAllExamsOnSubject(subjectId);
  }
}
