import 'package:exam_app/features/auth/signin/domain/entities/user.dart';

abstract class SigninRepository {
 Future<User> Signin(String email, String password);
}
