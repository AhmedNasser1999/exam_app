import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/subjects/api/data_source/subject_data_source_impl.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SubjectRepoImpl implements SubjectRepository {
  final SubjectDataSourceImpl subjectDataSourceImpl;

  SubjectRepoImpl({required this.subjectDataSourceImpl});


  @override
Future<Either<Failure, List<SubjectEntity>>> fetchSubjects() async {
  try {
    final response = await subjectDataSourceImpl.fetchSubjects();

    final subjectEntities = response.subjects?.map((subject) {
      return SubjectEntity(
        icon: subject.icon,
        name: subject.name,
        id: subject.id,
      );
    }).toList();

    return Right(subjectEntities ?? []);
  } catch (e) {
    return Left(ServerFailure(errorMessage: e.toString()));
  }
}

}
