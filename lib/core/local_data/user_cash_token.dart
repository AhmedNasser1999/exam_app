import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class UserCashToken {
  static Future<void> saveToken({required String token}) async {
    final SharedPreferences pref = getIt<SharedPreferences>();
    await pref.setString(Constant.userToken, token);
  }

  static bool hasToken() {
    final SharedPreferences pref = getIt<SharedPreferences>();
    String? token = pref.getString(Constant.userToken);
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> removeToken() async {
    final SharedPreferences pref = getIt<SharedPreferences>();
    await pref.remove(Constant.userToken);
  }
}
