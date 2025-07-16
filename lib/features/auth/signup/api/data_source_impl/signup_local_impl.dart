
import 'dart:developer';

import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_local.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SignupLocal)
class SignupLocalImpl extends SignupLocal {
  final sharedPreferences = getIt<SharedPreferences>();
  @override
  Future<void> removeToken() async {
    await sharedPreferences.remove(Constant.token);
  }

  @override
  Future<void> saveToken({required String token}) async {
    log("Success Token Saved : $token");
    // await sharedPreferences.setString(Constant.token, token);
  }
}
