import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/home/explore/subjects/data/models/subject_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'subject_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class SubjectApiClient {
  @factoryMethod
  factory SubjectApiClient(Dio dio) = _SubjectApiClient;

  @GET(ApiConstants.subjects)
  Future<SubjectResponse> fetchSubjects();
}
