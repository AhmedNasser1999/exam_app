import 'package:dio/dio.dart';
import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final FlutterSecureStorage secureStorage = getIt<FlutterSecureStorage>();
    final Future<String?> token = secureStorage.read(key: Constant.userToken);

    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'token': token ?? '', 'Accept': 'application/json'},
      ),
    );
  }
}
