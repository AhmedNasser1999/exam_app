// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordTokenResponse _$ResetPasswordTokenResponseFromJson(
  Map<String, dynamic> json,
) => ResetPasswordTokenResponse(
  message: json['message'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$ResetPasswordTokenResponseToJson(
  ResetPasswordTokenResponse instance,
) => <String, dynamic>{'message': instance.message, 'token': instance.token};
