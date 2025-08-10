import 'package:exam_app/features/splash/domain/repo/splash_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteUserTokenUseCase {
  final SplashRepo _splashRepo;

  DeleteUserTokenUseCase(this._splashRepo);
  Future<void> call() async {
    await _splashRepo.deleteToken();
  }
}
