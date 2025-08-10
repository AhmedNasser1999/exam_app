import 'package:exam_app/features/home/sections/profile/change_password/api/client/change_password_api_client.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/data_source/change_password_data_source.dart';
import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  ChangePasswordApiClient changePasswordApiClient;

  ChangePasswordDataSourceImpl(this.changePasswordApiClient);

  @override
  Future<ChangePasswordResponse> changePassword(request) async {
    return await changePasswordApiClient.changePassword(request);
  }
}
