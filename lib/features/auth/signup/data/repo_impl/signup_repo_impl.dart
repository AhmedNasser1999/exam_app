
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_local.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_remote.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:exam_app/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  final SignupRemote signupRemote;
  final SignupLocal signupLocal;
  SignupRepoImpl({required this.signupRemote, required this.signupLocal});
  @override
  Future<Either<SignupEntities, Failure>> signup({
    required SignupRequestModel signupReq,
  }) async {
    try {
      var request = await signupRemote.signup(signupReq: signupReq);
      await signupLocal.saveToken(token: request.tokenEntities);
      return left(request);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      } else {
        return right(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
