
import 'package:json_annotation/json_annotation.dart';
part 'reset_password_token_request.g.dart';
@JsonSerializable()
class ResetPasswordTokenRequest {
  String email;

  String newPassword;

  ResetPasswordTokenRequest({required this.email, required this.newPassword});

  factory ResetPasswordTokenRequest.fromJson(json) =>
      _$ResetPasswordTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordTokenRequestToJson(this);
}
