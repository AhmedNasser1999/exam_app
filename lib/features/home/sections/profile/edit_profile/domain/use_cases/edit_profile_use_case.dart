import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProfileUseCase {
  final ProfileRepo _profileRepo;
  EditProfileUseCase(this._profileRepo);
  Future<ApiResult<ResponseEntity>> call(ProfileRequestModel request) async {
    return await _profileRepo.editProfile(request);
  }
}
