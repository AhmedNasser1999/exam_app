import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/subjects/domain/entities/subject_entity.dart';

abstract class SubjectRepository {
  Future<Either<Failure, SubjectEntity>> fetchSubjects();
}
