
import 'package:exam_app/core/api_result/api_result.dart';

import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SigninUseCase {
  SigninRepository repository;

  SigninUseCase({required this.repository});

  Future<ApiResult<UserEntities>> call(pram) async {
    return await repository.signin(request: pram);
  }
}
