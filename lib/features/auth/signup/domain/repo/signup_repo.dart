import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
abstract class SignupRepo {
  Future<ApiResult<SignupEntities>> signup({
    required SignupRequestModel signupReq,
  });
}
