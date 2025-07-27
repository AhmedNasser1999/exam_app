import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/subjects/api/data_source/subject_data_source_impl.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectRepository)
class SubjectRepoImpl implements SubjectRepository {
  SubjectDataSourceImpl subjectDataSourceImpl;

  SubjectRepoImpl({required this.subjectDataSourceImpl});

  @override
  Future<Either<Failure, SubjectEntity>> fetchSubjects() async {
    try {
      final subject = await subjectDataSourceImpl.fetchSubjects();
      return Right(
        SubjectEntity(icon: subject.icon, name: subject.name, id: subject.id),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
