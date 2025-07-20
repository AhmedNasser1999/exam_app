import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, ForgetPasswordSuccess>> submitResetEmail(String email);

  Future<Either<Failure, VerifyResetCode>> verifyResetCode(String resetCode);

  Future<Either<Failure, UserResetPasswordToken>> resetPassword(
    String email,
    String newPassword,
  );
}
