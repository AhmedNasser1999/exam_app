import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/splash/data/data_source/local/splash_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl extends SplashLocalDataSource {
  final UserTokenStorage userTokenStorage;

  SplashLocalDataSourceImpl({required this.userTokenStorage});
  @override
  Future<bool> getUserToken() async {
    return await userTokenStorage.hasToken();
  }
}
