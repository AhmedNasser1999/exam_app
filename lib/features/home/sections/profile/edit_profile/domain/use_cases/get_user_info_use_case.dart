import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserInfoUseCase {
  final ProfileRepo _profileRepo;

  GetUserInfoUseCase(this._profileRepo);
  Future<ApiResult<ProfileEntity>> call() async {
    return await _profileRepo.getProfileData();
  }
}
