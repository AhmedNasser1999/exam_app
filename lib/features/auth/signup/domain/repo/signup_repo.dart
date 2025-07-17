import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';

abstract class SignupRepo {
  Future<Either<SignupEntities, Failure>> signup({
    required SignupRequestModel signupReq,
  });
}
