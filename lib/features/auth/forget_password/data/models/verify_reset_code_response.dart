import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_code_response.g.dart';
@JsonSerializable()
class VerifyResetCodeResponse {
  final String status;
  VerifyResetCodeResponse({required this.status});

  factory VerifyResetCodeResponse.fromJson(json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> tojson() => _$VerifyResetCodeResponseToJson(this);
}
