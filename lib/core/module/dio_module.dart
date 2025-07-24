import 'package:dio/dio.dart';
import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final SharedPreferences pref = getIt<SharedPreferences>();
    final String? token = pref.getString(Constant.userToken);

    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'token': token ?? '', 'Accept': 'application/json'},
      ),
    );
  }
}
