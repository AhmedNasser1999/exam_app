import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SigninResponse extends UserEntities {
  @override
  final String token;

  SigninResponse({required this.token}) : super(token: token);

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
