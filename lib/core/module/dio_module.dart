import 'package:dio/dio.dart';

import 'package:exam_app/core/constant/api_contants.dart';

import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @injectable
  Dio dio() {
    return Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }
}
