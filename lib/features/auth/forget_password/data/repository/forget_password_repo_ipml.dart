import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/api/forget_password_api_client.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordRepoIpml implements ForgetPasswordRepo {
  ForgetPasswordApiClient forgetPasswordApiClient;

  ForgetPasswordRepoIpml(this.forgetPasswordApiClient);
  //  submit Reset Email
  @override
  Future<Either<Failure, ForgetPasswordSuccess>> submitResetEmail(
    String email,
  ) async {
    try {
      final response = await forgetPasswordApiClient.submitResetEmail(
        ForgetPasswordRequest(email: email),
      );

      return Right(ForgetPasswordSuccess(info: response.message));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //verify Reset Code
  @override
  Future<Either<Failure, VerifyResetCode>> verifyResetCode(
    String resetCode,
  ) async {
    try {
      final response = await forgetPasswordApiClient.verifyResetCode(
        VerifyResetCodeRequest(resetCode: resetCode),
      );

      return Right(VerifyResetCode(status: response.status));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //verify Reset password
  @override
  Future<Either<Failure, UserResetPasswordToken>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final response = await forgetPasswordApiClient.resetPassword(
        ResetPasswordTokenRequest(email: email, newPassword: newPassword),
      );
      return Right(UserResetPasswordToken(token: response.token));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
