import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';

abstract class UseCasePram<Type, Pram> {
  Future<Either<Type, Failure>> call(Pram);
}
