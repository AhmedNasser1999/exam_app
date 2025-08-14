import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase
    extends UseCasePram<VerifyResetCode, VerifyResetCodeRequest> {
  final ForgetPasswordRepo forgetPasswordRepo;

  VerifyResetCodeUseCase({required this.forgetPasswordRepo});

  @override
  Future<ApiResult<VerifyResetCode>> call(pram) async {
    return await forgetPasswordRepo.verifyResetCode(request: pram);
  }
}
