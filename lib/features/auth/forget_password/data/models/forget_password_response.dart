import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final String message;
  
  ForgetPasswordResponse({required this.message});

  factory ForgetPasswordResponse.fromJson(json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> tojson() => _$ForgetPasswordResponseToJson(this);
}
