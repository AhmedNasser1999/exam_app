import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_request.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/repository/change_password_repo_impl.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUseCase {
  ChangePasswordRepoImpl changePasswordRepoImpl;

  ChangePasswordUseCase({required this.changePasswordRepoImpl});

  Future<Either<Failure, ChangePasswordEntity>> execute(
    ChangePasswordRequest request,
  ) async {
    return await changePasswordRepoImpl.changePassword(request);
  }
}
