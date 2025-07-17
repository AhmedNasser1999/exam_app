import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';

abstract class SignupRemote {
  Future<SignupEntities> signup({required SignupRequestModel signupReq});
}
