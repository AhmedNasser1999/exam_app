import 'package:exam_app/features/auth/signin/data/repository/Signin_repository_impl.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  SigninRepositoryImpl repository;

  SigninUsecase(this.repository);
  Future<User> execute(String email, String password) {
    return repository.Signin(email, password);
  }
}
