import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_response/signup_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio) = _SignupApiClient;

  @POST(ApiConstants.signUpEndPoint)
  Future<SignupResponseModel> signup(@Body() signupRequestModel);
}
