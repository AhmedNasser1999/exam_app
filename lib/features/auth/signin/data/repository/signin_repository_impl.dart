import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Future<Either<UserEntities, Failure>> signin({
    required SigninRequest request,
  }) async {
    try {
      final response = await signinRemote.signIn(request: request);
      return left(response);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      } else {
        return right(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> rememberMe({required String token}) async {
    try {
      await storeUserToken.saveToken(token: token);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
