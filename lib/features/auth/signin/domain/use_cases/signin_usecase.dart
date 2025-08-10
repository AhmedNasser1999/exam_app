import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SigninUseCase extends UseCasePram<UserEntities, SigninRequest> {
  SigninRepository repository;

  SigninUseCase({required this.repository});

  @override
  Future<Either<UserEntities, Failure>> call(pram) async {
    return await repository.signin(request: pram);
  }
}
