import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';

abstract class ForgetPasswordRepo {
  Future<Either<ForgetPasswordSuccess, Failure>> submitResetEmail({
    required ForgetPasswordRequest request,
  });

  Future<Either<VerifyResetCode, Failure>> verifyResetCode({
    required VerifyResetCodeRequest request,
  });

  Future<Either<UserResetPasswordToken, Failure>> resetPassword({
    required ResetPasswordTokenRequest request,
  });
}
