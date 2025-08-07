import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserInfoUseCase {
  final ProfileRepo _profileRepo;

  GetUserInfoUseCase(this._profileRepo);
  Future<Either<Failure, ProfileEntity>> call() async {
    return await _profileRepo.getProfileData();
  }
}
