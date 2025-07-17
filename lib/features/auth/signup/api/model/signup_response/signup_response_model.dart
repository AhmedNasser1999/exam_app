import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel extends SignupEntities {
  final String message;
  final String token;
  final User user;

  SignupResponseModel({
    required this.message,
    required this.token,
    required this.user,
  }) : super(email: user.email, tokenEntities: token, userName: user.username);

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
