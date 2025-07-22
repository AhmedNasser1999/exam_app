import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class RememberMeUseCase {
  final SigninRepository signinRepository;

  RememberMeUseCase({required this.signinRepository});
  Future<void> call({required String token}) async {
    await signinRepository.rememberMe(token: token);
  }
}
