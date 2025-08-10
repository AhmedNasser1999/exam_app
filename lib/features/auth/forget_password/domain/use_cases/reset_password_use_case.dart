import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase
    extends UseCasePram<UserResetPasswordToken, ResetPasswordTokenRequest> {
  final ForgetPasswordRepo forgetPasswordRepo;

  ResetPasswordUseCase({required this.forgetPasswordRepo});

  @override
  Future<Either<UserResetPasswordToken, Failure>> call(pram) async {
    return await forgetPasswordRepo.resetPassword(request: pram);
  }
}
