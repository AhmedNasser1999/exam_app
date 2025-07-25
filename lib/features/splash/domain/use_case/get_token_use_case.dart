import 'package:exam_app/features/splash/domain/repo/splash_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetTokenUseCase {
  final SplashRepo splashRepo;

  GetTokenUseCase({required this.splashRepo});
  Future<bool> call() async {
    return await splashRepo.userHasToken();
  }
}
