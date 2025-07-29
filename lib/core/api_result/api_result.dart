import 'package:exam_app/core/error/failure.dart';

sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess({required this.data});
}

class ApiFailure<T> extends ApiResult<T> {
  final Failure failure;

  ApiFailure({required this.failure});
}
