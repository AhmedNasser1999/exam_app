import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/questions_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_result_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'questions_api_client.g.dart';

@injectable
@RestApi()
abstract class QuestionsApiClient {
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;

  @GET(ApiConstants.questions)
  Future<QuestionResponse> getAllQuestionsOnExam({
    @Header("token") required String token,
    @Query("exam") required String examId,
  });
  @POST(ApiConstants.checkQuestion)
  Future<ExamResultResponseModel> checkQuestionsOnExam({
    @Header("token") required String token,
    @Body() required ExamSubmitRequestModel question,
  });
}
