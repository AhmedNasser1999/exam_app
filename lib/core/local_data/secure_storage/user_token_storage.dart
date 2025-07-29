abstract class UserTokenStorage {
  Future<void> saveToken({required String token});
  Future<bool> hasToken();
  Future<void> removeToken();
  Future<String?> getToken({required String tokenKey});
}