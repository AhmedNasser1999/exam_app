import 'package:exam_app/features/auth/signin/domain/entities/user.dart';

abstract class SigninRepository {
  Future<User> signin(String email, String password);
}
