import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  SignupRequestModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
