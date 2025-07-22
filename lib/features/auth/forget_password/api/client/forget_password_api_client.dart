import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_response.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'forget_password_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  //forget password
  @POST(ApiConstants.forgotPassword)
  Future<ForgetPasswordResponse> submitResetEmail(
    @Body() ForgetPasswordRequest request,
  );

  //verify Reset Code
  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() VerifyResetCodeRequest request,
  );

  //reset Password
  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordTokenResponse> resetPassword(
    @Body() ResetPasswordTokenRequest request,
  );
}
