import 'package:exam_app/core/api_result/api_result.dart';

abstract class UseCasePram<Type, Pram> {
  Future<ApiResult<Type>> call(pram);
}
