import 'package:json_annotation/json_annotation.dart';
part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  String oldPassword;
  String password;
  String rePassword;

  ChangePasswordRequest(this.oldPassword, this.password, this.rePassword);

  factory ChangePasswordRequest.fromJson(json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
