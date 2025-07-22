import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';

abstract class SigninRepository {
  Future<Either<UserEntities, Failure>> signin({
    required SigninRequest request,
  });
  Future<void> rememberMe({required String token});
}
