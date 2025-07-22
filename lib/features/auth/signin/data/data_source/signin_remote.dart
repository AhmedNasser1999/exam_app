import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';

abstract class SigninRemote {
  Future<SigninResponse> signIn({required SigninRequest request});
}
