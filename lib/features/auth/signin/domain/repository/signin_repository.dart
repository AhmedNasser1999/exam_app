import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';

abstract class SigninRepository {
  Future<ApiResult<UserEntities>> signin({
    required SigninRequest request,
  });
}
