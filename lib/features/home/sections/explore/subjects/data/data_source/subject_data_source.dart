
import 'package:exam_app/features/home/sections/explore/subjects/data/models/subject_response.dart';

abstract class SubjectDataSource {
  Future<SubjectResponse> fetchSubjects({required String token});
}
