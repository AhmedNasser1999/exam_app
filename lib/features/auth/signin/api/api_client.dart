import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiConstants.signInEndPoint)
  Future<SigninResponse> login(@Body() SigninRequest request);
}
