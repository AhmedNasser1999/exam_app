import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/features/splash/data/data_source/local/splash_local_data_source.dart';
import 'package:exam_app/features/splash/domain/repo/splash_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SplashRepo)
class SplashRepoImpl extends SplashRepo {
  final SplashLocalDataSource _splashLocalDataSource;
  final ResultExamLocal _resultExamLocal;
  SplashRepoImpl(this._splashLocalDataSource, this._resultExamLocal);
  @override
  Future<bool> userHasToken() async {
    final bool userToken = await _splashLocalDataSource.getRememberMe();
    if (!userToken) {
      _resultExamLocal.deleteAllResult();
    }
    return userToken;
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
  }
}
