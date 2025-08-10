import 'package:json_annotation/json_annotation.dart';
part 'forget_password_request.g.dart';
@JsonSerializable()
class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest({required this.email});

  factory ForgetPasswordRequest.fromjson(json) =>
      _$ForgetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
