import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class StoreUserToken {
  final SharedPreferences pref;

  StoreUserToken(this.pref);

  static const String userToken = 'userToken';

  Future<void> saveToken(String token) async {
    await pref.setString(userToken, token);
  }

  Future<String?> getToken() async{
    return pref.getString(userToken);
  }
}
