import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/exams/data/repository/exams_repo_impl.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamsUseCase {
  final ExamsRepoImpl examsRepoImpl;

  ExamsUseCase({required this.examsRepoImpl});

  Future<Either<Failure, ExamEntity>> execute(String subjectId) async {
    return await examsRepoImpl.getAllExamsOnSubject(subjectId);
  }
}
