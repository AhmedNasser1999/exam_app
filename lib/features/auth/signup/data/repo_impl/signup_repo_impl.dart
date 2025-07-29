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
      var request = await signupRemote.signup(signupReq: signupReq);
      return ApiSuccess<SignupEntities>(data: request);
    } catch (e) {
      if (e is DioException) {
        return ApiFailure<SignupEntities>(failure: ServerFailure.fromDio(e));
      } else {
        return ApiFailure<SignupEntities>(
          failure: ServerFailure(errorMessage: e.toString()),
        );
      }
    }
  }
}
