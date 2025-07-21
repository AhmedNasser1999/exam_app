import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse extends VerifyResetCode {
  final String status;
  VerifyResetCodeResponse({required this.status}) : super(status: status);

  factory VerifyResetCodeResponse.fromJson(json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> tojson() => _$VerifyResetCodeResponseToJson(this);
}
