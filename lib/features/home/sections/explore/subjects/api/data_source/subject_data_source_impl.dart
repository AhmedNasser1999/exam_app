import 'package:exam_app/features/home/sections/explore/subjects/api/client/subject_api_client.dart';
import 'package:exam_app/features/home/sections/explore/subjects/data/data_source/subject_data_source.dart';
import 'package:exam_app/features/home/sections/explore/subjects/data/models/subject_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubjectDataSource)
class SubjectDataSourceImpl implements SubjectDataSource {
  final SubjectApiClient subjectApiClient;

  SubjectDataSourceImpl({required this.subjectApiClient});

  @override
  Future<SubjectResponse> fetchSubjects({required String token}) async {
    return await subjectApiClient.fetchSubjects(token);
  }
}
