import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/api/data_source/profile_data_source_impl.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/data_source/profile_local_data_source.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileRepoImpl implements ProfileRepo {
  ProfileDataSourceImpl profileDataSourceImpl;
  ProfileRepoImpl(this.profileDataSourceImpl);
  @override
  Future<Either<Failure, ProfileEntity>> editProfile(request) async {
    try {
      final profile = await profileDataSourceImpl.editProfile(request);

      final profileEntity = ProfileEntity(
        username: profile.user!.username ?? '',
        firstName: profile.user!.firstName ?? '',
        lastName: profile.user!.lastName ?? '',
        email: profile.user!.email ?? '',
        phone: profile.user!.phone ?? '',
      );

      ProfileLocalDataSource.saveProfileToPrefs(profileEntity);

      return Right(profileEntity);
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.response?.data}');
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
