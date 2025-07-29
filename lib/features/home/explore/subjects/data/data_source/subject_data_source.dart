import 'package:exam_app/features/home/explore/subjects/data/models/subject_response.dart';

abstract class SubjectDataSource {
  Future<SubjectResponse> fetchSubjects();
}
