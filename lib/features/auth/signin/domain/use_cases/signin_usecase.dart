import 'package:exam_app/features/auth/signin/domain/entities/user.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SigninUseCase {
  SigninRepository repository;

  SigninUseCase(this.repository);
  Future<User> execute(String email, String password) {
    return repository.signin(email, password);
  }
}
