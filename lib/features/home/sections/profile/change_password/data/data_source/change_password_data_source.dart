import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_response.dart';

abstract class ChangePasswordDataSource {
  Future<ChangePasswordResponse> changePassword(request);
}
