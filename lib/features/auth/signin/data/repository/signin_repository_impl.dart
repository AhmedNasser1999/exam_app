import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signin/data/data_source/signin_remote.dart';
import 'package:exam_app/features/auth/signin/data/data_source/store_user_token.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SigninRepository)
class SigninRepositoryImpl extends SigninRepository {
  final SigninRemote signinRemote;
  final StoreUserToken storeUserToken;
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
      return ApiSuccess<UserEntities>(data: response);
    } catch (e) {
      if (e is DioException) {
        return ApiFailure<UserEntities>(failure: ServerFailure.fromDio(e));
      } else {
        return ApiFailure<UserEntities>(
          failure: ServerFailure(errorMessage: e.toString()),
        );
      }
    }
  }

  void _handleRememberMe({
    required SigninRequest request,
    required UserEntities response,
  }) async {
    if (request.isRememberMe) {
      await storeUserToken.saveToken(token: response.token);
    }
  }
}
