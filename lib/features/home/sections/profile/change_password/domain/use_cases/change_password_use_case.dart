import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/use_case/use_case_pram.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_request.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/repository/change_password_repo_impl.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUseCase
    extends UseCasePram<ChangePasswordEntity, ChangePasswordRequest> {
  ChangePasswordRepoImpl changePasswordRepoImpl;

  ChangePasswordUseCase({required this.changePasswordRepoImpl});
  @override
  Future<ApiResult<ChangePasswordEntity>> call(pram) async {
    return await changePasswordRepoImpl.changePassword(pram);
  }
}
