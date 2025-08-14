import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';

abstract class ProfileRepo {
  Future<ApiResult<ResponseEntity>> editProfile(ProfileRequestModel request);

  Future<ApiResult<ProfileEntity>> getProfileData();
  Future<void> logout();
}
