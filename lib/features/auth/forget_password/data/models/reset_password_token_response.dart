import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reset_password_token_response.g.dart';

@JsonSerializable()
class ResetPasswordTokenResponse extends UserResetPasswordToken {
  String message;

  @override
  String token;

  ResetPasswordTokenResponse({required this.message, required this.token})
    : super(token: token);

  factory ResetPasswordTokenResponse.fromJson(json) =>
      _$ResetPasswordTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordTokenResponseToJson(this);
}
