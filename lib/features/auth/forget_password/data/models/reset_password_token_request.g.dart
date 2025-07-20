// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordTokenRequest _$ResetPasswordTokenRequestFromJson(
  Map<String, dynamic> json,
) => ResetPasswordTokenRequest(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordTokenRequestToJson(
  ResetPasswordTokenRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
};
