import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectsUseCase {
  SubjectRepository subjectRepoImpl;

  GetSubjectsUseCase({required this.subjectRepoImpl});

  Future<Either<Failure, List<SubjectEntity>>> execute() async {
    return await subjectRepoImpl.fetchSubjects();
  }
}
