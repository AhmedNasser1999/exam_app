import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase
    extends UseCasePram<ForgetPasswordSuccess, ForgetPasswordRequest> {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUseCase({required this.forgetPasswordRepo});

  @override
  Future<Either<ForgetPasswordSuccess, Failure>> call(pram) async {
    return await forgetPasswordRepo.submitResetEmail(request: pram);
  }
}
