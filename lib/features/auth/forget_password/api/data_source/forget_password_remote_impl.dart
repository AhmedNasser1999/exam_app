import 'package:exam_app/features/auth/forget_password/api/client/forget_password_api_client.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_password_remote.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ForgetPasswordRemote)
class ForgetPasswordRemoteImpl extends ForgetPasswordRemote {
  final ForgetPasswordApiClient forgetPasswordApiClient;

  ForgetPasswordRemoteImpl({required this.forgetPasswordApiClient});
  @override
  Future<UserResetPasswordToken> resetPassword({
    required ResetPasswordTokenRequest request,
  }) async {
    return await forgetPasswordApiClient.resetPassword(request);
  }

  @override
  Future<ForgetPasswordSuccess> submitResetEmail({
    required ForgetPasswordRequest request,
  }) async {
    return await forgetPasswordApiClient.submitResetEmail(request);
  }

  @override
  Future<VerifyResetCode> verifyResetCode({
    required VerifyResetCodeRequest request,
  }) async {
    return await forgetPasswordApiClient.verifyResetCode(request);
  }
}
