import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserTokenStorage)
class UserTokenStorageImpl implements UserTokenStorage {
  final FlutterSecureStorage secureStorage;

  UserTokenStorageImpl({required this.secureStorage});

  @override
  Future<void> saveToken({required String token}) async {
    await secureStorage.write(key: Constant.userToken, value: token);
  }

  @override
  Future<bool> hasToken() async {
    return await secureStorage.containsKey(key: Constant.userToken);
  }

  @override
  Future<void> removeToken() async {
    await secureStorage.delete(key: Constant.userToken);
  }

  @override
  Future<String> getToken({required String tokenKey}) async {
    final String? token = await secureStorage.read(key: Constant.userToken);
    if (token == null) {
      return "user no have token";
    } else {
      return token;
    }
  }
}
