import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/questions_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'questions_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class QuestionsApiClient {
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;

  @GET(ApiConstants.questions)
  Future<QuestionsResponseModel> getAllQuestinsOnExam(
    @Query("exam") String examId,
  );
}
