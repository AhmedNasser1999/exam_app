import 'package:exam_app/features/home/explore/subjects/domain/entities/subject_entity.dart';

abstract class SubjectDataSource {
  Future<SubjectEntity> fetchSubjects();
}
