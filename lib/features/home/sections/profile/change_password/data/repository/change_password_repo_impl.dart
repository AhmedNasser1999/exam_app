import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/change_password/api/data_sourcce/change_password_data_source_impl.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/entities/change_password_entity.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/repository/change_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  ChangePasswordDataSourceImpl changePasswordDataSourceImpl;

  ChangePasswordRepoImpl(this.changePasswordDataSourceImpl);
  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(request) async {
    try {
      final response = await changePasswordDataSourceImpl.changePassword(
        request,
      );
      return SuccessApiResult<ChangePasswordEntity>(
        data: ChangePasswordEntity(token: response.token),
      );
    } catch (e) {
      if (e is DioException) {
        return FailureApiResult<ChangePasswordEntity>(
          error: ServerFailure.fromDio(e),
        );
      }
      return FailureApiResult<ChangePasswordEntity>(
        error: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
