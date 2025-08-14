import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';

abstract class ForgetPasswordRepo {
  Future<ApiResult<ForgetPasswordSuccess>> submitResetEmail({
    required ForgetPasswordRequest request,
  });

  Future<ApiResult<VerifyResetCode>> verifyResetCode({
    required VerifyResetCodeRequest request,
  });

  Future<ApiResult<UserResetPasswordToken>> resetPassword({
    required ResetPasswordTokenRequest request,
  });
}
