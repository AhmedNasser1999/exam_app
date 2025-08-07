import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @injectable
  Dio dio(UserTokenStorage tokenStorage) {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final hasToken = await tokenStorage.hasToken();
          if (hasToken) {
            final token = await tokenStorage.getToken(
              tokenKey: Constant.userToken,
            );
            options.headers['token'] = token;
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
