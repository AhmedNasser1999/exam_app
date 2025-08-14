import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';

abstract class SubjectRepository {
  Future<ApiResult<List<SubjectEntity>>> fetchSubjects();
}
