import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/api_contants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
}
