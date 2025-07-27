import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/explore/subjects/data/repository/subject_repo_impl.dart';
import 'package:exam_app/features/home/explore/subjects/domain/entities/subject_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetSubjectsUseCase {
  SubjectRepoImpl subjectRepoImpl;

  GetSubjectsUseCase({required this.subjectRepoImpl});

  Future<Either<Failure, SubjectEntity>> execute() async {
    return await subjectRepoImpl.fetchSubjects();
  }
}
