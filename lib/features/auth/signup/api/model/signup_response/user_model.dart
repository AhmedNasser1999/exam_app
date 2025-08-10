import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  @JsonKey(name: '_id')
  final String id;
  final DateTime createdAt;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.id,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
