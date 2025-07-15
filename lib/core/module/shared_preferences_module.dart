import 'package:dio/dio.dart';
import 'package:exam_app/core/api/api_end_point.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: ApiEndPoint.baseUrl));
}
