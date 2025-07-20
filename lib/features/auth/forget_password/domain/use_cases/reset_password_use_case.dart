import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/data/repository/forget_password_repo_ipml.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepoIpml forgetPasswordRepoIpml;
  ResetPasswordUseCase({required this.forgetPasswordRepoIpml});

  Future<Either<Failure, UserResetPasswordToken>> execute(
    String email,
    String newPassword,
  ) async {
    return await forgetPasswordRepoIpml.resetPassword(email, newPassword);
  }
}
