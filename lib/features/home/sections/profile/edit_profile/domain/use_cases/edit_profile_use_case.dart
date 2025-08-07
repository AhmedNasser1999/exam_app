import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/repository/profile_repo_impl.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProfileUseCase {
  ProfileRepoImpl profileRepoImpl;

  EditProfileUseCase(this.profileRepoImpl);

  Future<Either<Failure, ResponseEntity>> execute(
    ProfileRequestModel request,
  ) async {
    return await profileRepoImpl.editProfile(request);
  }

  Future<Either<Failure, ProfileEntity>> executeGetProgileData() async {
    return await profileRepoImpl.getProfileData();
  }
}
