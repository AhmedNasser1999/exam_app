import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signin_request.g.dart';

@JsonSerializable()
class SigninRequest extends Equatable {
  final String email;
  final String password;
  @JsonKey(includeToJson: false)
  @JsonKey(includeFromJson: false)
  final bool isRememberMe;
  SigninRequest({
    required this.email,
    required this.password,
    required this.isRememberMe,
  });

  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);

  @override
  List<Object?> get props => [email, password, isRememberMe];
}
