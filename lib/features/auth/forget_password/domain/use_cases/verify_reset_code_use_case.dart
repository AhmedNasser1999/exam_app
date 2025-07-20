import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/forget_password/data/repository/forget_password_repo_ipml.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  ForgetPasswordRepoIpml verifyResetCodeRepoImpl;

  VerifyResetCodeUseCase({required this.verifyResetCodeRepoImpl});
  Future<Either<Failure, VerifyResetCode>> execute(resetCode) async {
    return await verifyResetCodeRepoImpl.verifyResetCode(resetCode);
  }
}
