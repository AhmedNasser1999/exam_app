import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_remote.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:exam_app/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  final SignupRemote signupRemote;
  SignupRepoImpl({required this.signupRemote});
  @override
  Future<ApiResult<SignupEntities>> signup({
    required SignupRequestModel signupReq,
  }) async {
    try {
      var response = await signupRemote.signup(signupReq: signupReq);
      return SuccessApiResult<SignupEntities>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<SignupEntities>(
          error: ServerFailure.fromDio(e),
        );
      } else {
        return FailureApiResult(
          error: ServerFailure(errorMessage: e.toString()),
        );
      }
    }
  }
}
