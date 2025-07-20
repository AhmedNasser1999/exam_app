import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/data/repository/forget_password_repo_ipml.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepoIpml forgetPasswordRepoIpml;
  ForgetPasswordUseCase(this.forgetPasswordRepoIpml);

  Future<Either<Failure, ForgetPasswordSuccess>> execute(email) async {
    return await forgetPasswordRepoIpml.submitResetEmail(email);
  }
}
