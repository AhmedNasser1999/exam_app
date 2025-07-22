import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Future<Either<ForgetPasswordSuccess, Failure>> submitResetEmail({
    required ForgetPasswordRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.submitResetEmail(
        request: request,
      );

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }

  //verify Reset Code
  @override
  Future<Either<VerifyResetCode, Failure>> verifyResetCode({
    required VerifyResetCodeRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.verifyResetCode(
        request: request,
      );

      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }

  //verify Reset password
  @override
  Future<Either<UserResetPasswordToken, Failure>> resetPassword({
    required ResetPasswordTokenRequest request,
  }) async {
    try {
      final response = await forgetPasswordRemote.resetPassword(
        request: request,
      );
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      }
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }
}
