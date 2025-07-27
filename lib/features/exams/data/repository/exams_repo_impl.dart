import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/exams/api/data_source/exam_data_source_impl.dart';
import 'package:exam_app/features/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/exams/domain/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExamsRepoImpl implements ExamRepository {
  ExamDataSourceImpl examDataSourceImpl;
  ExamsRepoImpl({required this.examDataSourceImpl});
  @override
  Future<Either<Failure, ExamEntity>> getAllExamsOnSubject(
    String subjectId,
  ) async {
    try {
      final exam = await examDataSourceImpl.getAllExamsOnSubject(subjectId);
      return Right(
        ExamEntity(
          id: exam.id,
          title: exam.title,
          duration: exam.duration,
          subjectId: exam.subjectId,
          numberOfQuestions: exam.numberOfQuestions,
          isActive: exam.isActive,
          createdAt: exam.createdAt,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
