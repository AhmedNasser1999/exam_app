abstract class SplashLocalDataSource {
  Future<bool> getRememberMe();
  Future<void> deleteToken();
}
