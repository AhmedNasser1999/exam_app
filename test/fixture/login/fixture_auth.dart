import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';

abstract class FixtureAuth {
  static SigninResponse signinResponse() {
    return SigninResponse(token: "fake_token");
  }

  static SigninRequest signinRequest() {
    return SigninRequest(
      email: "fake_email",
      password: "password fake",
      isRememberMe: true,
    );
  }

  static UserEntities userEntities() {
    return UserEntities(token: "fake_token");
  }
}
