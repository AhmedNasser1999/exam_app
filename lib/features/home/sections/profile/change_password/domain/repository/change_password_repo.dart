import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_request.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/entities/change_password_entity.dart';

abstract class ChangePasswordRepo {
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequest request,
  );
}
