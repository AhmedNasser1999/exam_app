import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_password_remote.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  ForgetPasswordRemote forgetPasswordRemote;

  ForgetPasswordRepoImpl(this.forgetPasswordRemote);
  //  submit Reset Email
  @override
  Future<ApiResult<ForgetPasswordSuccess>> submitResetEmail({
    required ForgetPasswordRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.submitResetEmail(
        request: request,
      );

      return SuccessApiResult<ForgetPasswordSuccess>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<ForgetPasswordSuccess>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<ForgetPasswordSuccess>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }

  //verify Reset Code
  @override
  Future<ApiResult<VerifyResetCode>> verifyResetCode({
    required VerifyResetCodeRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.verifyResetCode(
        request: request,
      );

      return SuccessApiResult<VerifyResetCode>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<VerifyResetCode>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<VerifyResetCode>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }

  //verify Reset password
  @override
  Future<ApiResult<UserResetPasswordToken>> resetPassword({
    required ResetPasswordTokenRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.resetPassword(
        request: request,
      );
      return SuccessApiResult<UserResetPasswordToken>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<UserResetPasswordToken>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
