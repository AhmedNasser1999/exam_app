import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_response_model.dart';

abstract class ProfileDataSource {
  Future<ProfileResponseModel> editProfile(request);
}
