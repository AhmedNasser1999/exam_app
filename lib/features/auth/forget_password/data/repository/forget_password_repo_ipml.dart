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

      return ApiSuccess<ForgetPasswordSuccess>(data: response);
    } catch (e) {
      if (e is DioException) {
        return ApiFailure<ForgetPasswordSuccess>(
          failure: ServerFailure.fromDio(e),
        );
      }
      return ApiFailure<ForgetPasswordSuccess>(
        failure: ServerFailure(errorMessage: e.toString()),
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

      return ApiSuccess<VerifyResetCode>(data: response);
    } catch (e) {
      if (e is DioException) {
        return ApiFailure<VerifyResetCode>(failure: ServerFailure.fromDio(e));
      }
      return ApiFailure<VerifyResetCode>(
        failure: ServerFailure(errorMessage: e.toString()),
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
      return ApiSuccess<UserResetPasswordToken>(data: response);
    } catch (e) {
      if (e is DioException) {
        return ApiFailure<UserResetPasswordToken>(
          failure: ServerFailure.fromDio(e),
        );
      }
      return ApiFailure<UserResetPasswordToken>(
        failure: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
