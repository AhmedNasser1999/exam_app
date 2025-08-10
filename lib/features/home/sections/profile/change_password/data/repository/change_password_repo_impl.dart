import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, ChangePasswordEntity>> changePassword(request) async {
    try {
      final response = await changePasswordDataSourceImpl.changePassword(
        request,
      );
      return Right(ChangePasswordEntity(token: response.token));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
