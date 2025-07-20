import 'package:json_annotation/json_annotation.dart';
 part 'reset_password_token_response.g.dart';
@JsonSerializable()
class ResetPasswordTokenResponse {
  String message;

  String token;

  ResetPasswordTokenResponse({required this.message, required this.token});

  factory ResetPasswordTokenResponse.fromJson(json) =>
      _$ResetPasswordTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordTokenResponseToJson(this);
}
