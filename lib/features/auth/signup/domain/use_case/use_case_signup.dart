import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:exam_app/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UseCaseSignup extends UseCasePram<SignupEntities, SignupRequestModel> {
  final SignupRepo signupRepo;

  UseCaseSignup({required this.signupRepo});

  @override
  Future<ApiResult<SignupEntities>> call(signupReq) async {
    return await signupRepo.signup(signupReq: signupReq);
  }
}
