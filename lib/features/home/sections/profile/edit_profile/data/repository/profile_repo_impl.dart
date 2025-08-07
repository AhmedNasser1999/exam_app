import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/data_source/profile_data_source.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource _profileDataSource;
  final UserTokenStorage _userTokenStorage;
  final ResultExamLocal _resultExamLocal;
  ProfileRepoImpl(
    this._profileDataSource,
    this._userTokenStorage,
    this._resultExamLocal,
  );
  @override
  Future<Either<Failure, ResponseEntity>> editProfile(request) async {
    try {
      final profile = await _profileDataSource.editProfile(request);

      final responseEntity = ResponseEntity(
        username: profile.user!.username ?? '',
        firstName: profile.user!.firstName ?? '',
        lastName: profile.user!.lastName ?? '',
        email: profile.user!.email ?? '',
        phone: profile.user!.phone ?? '',
      );

      return Right(responseEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfileData() async {
    try {
      final profileData = await _profileDataSource.getProfileData();

      final profileEntity = ProfileEntity(
        username: profileData.user!.username ?? '',
        firstName: profileData.user!.firstName ?? '',
        lastName: profileData.user!.lastName ?? '',
        email: profileData.user!.email ?? '',
        phone: profileData.user!.phone ?? '',
      );

      return Right(profileEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDio(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    _resultExamLocal.deleteAllResult();
    await _userTokenStorage.removeToken();
  }
}
