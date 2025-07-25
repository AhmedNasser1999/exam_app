import 'package:exam_app/features/splash/data/data_source/local/splash_local_data_source.dart';
import 'package:exam_app/features/splash/domain/repo/splash_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SplashRepo)
class SplashRepoImpl extends SplashRepo {
  final SplashLocalDataSource splashLocalDataSource;

  SplashRepoImpl({required this.splashLocalDataSource});
  @override
  Future<bool> userHasToken() async {
    return await splashLocalDataSource.getUserToken();
  }
}
