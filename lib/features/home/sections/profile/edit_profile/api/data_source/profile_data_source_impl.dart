import 'package:exam_app/features/home/sections/profile/edit_profile/api/client/profile_api_client.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/data_source/profile_data_source.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_response_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileDataSourceImpl implements ProfileDataSource {
  ProfileApiClient profileApiClient;
  ProfileDataSourceImpl({required this.profileApiClient});
  @override
  Future<ProfileResponseModel> editProfile(request) async {
    return await profileApiClient.editProfile(request);
  }
}
