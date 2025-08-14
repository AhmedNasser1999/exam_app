import 'package:exam_app/core/error/failure.dart';

sealed class ApiResult<T> {}

class SuccessApiResult<T> extends ApiResult<T> {
  final T data;

  SuccessApiResult({required this.data});
}

class FailureApiResult<T> extends ApiResult<T> {
  final ServerFailure error;

  FailureApiResult({required this.error});
}
