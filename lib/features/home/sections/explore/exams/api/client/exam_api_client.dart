import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/home/sections/explore/exams/data/models/exams_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
 part 'exam_api_client.g.dart';
@lazySingleton
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(ApiConstants.exams)
  Future<ExamsResponseModel> fetchExamsBySubject(@Query("subject") String subjectId);
}
