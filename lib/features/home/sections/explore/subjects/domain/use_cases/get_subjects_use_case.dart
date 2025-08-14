import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectsUseCase {
  SubjectRepository subjectRepoImpl;

  GetSubjectsUseCase({required this.subjectRepoImpl});

  Future<ApiResult<List<SubjectEntity>>> call() async {
    return await subjectRepoImpl.fetchSubjects();
  }
}
