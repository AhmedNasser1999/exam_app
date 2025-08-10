import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse extends ForgetPasswordSuccess {
  final String message;

  ForgetPasswordResponse({required this.message}) : super(info: message);

  factory ForgetPasswordResponse.fromJson(json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> tojson() => _$ForgetPasswordResponseToJson(this);
}
