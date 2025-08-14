import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/auth/signin/data/data_source/signin_remote.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SigninRepository)
class SigninRepositoryImpl extends SigninRepository {
  final SigninRemote signinRemote;
  final UserTokenStorage storeUserToken;
  SigninRepositoryImpl({
    required this.signinRemote,
    required this.storeUserToken,
  });
  @override
  Future<ApiResult<UserEntities>> signin({
    required SigninRequest request,
  }) async {
    try {
      final response = await signinRemote.signIn(request: request);
      _handleRememberMe(request: request, response: response);
      return SuccessApiResult<UserEntities>(data: response);
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<UserEntities>(
          error: ServerFailure.fromDio(e),
        );
      } else {
        return FailureApiResult<UserEntities>(
          error: ServerFailure(errorMessage: e.toString()),
        );
      }
    }
  }

  void _handleRememberMe({
    required SigninRequest request,
    required UserEntities response,
  }) async {
    await storeUserToken.saveRememberMe(
      rememberMe: request.isRememberMe.toString(),
    );
    await storeUserToken.saveToken(token: response.token);
  }
}
