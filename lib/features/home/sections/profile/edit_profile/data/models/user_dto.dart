import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  String? sId;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? password;
  bool? isVerified;
  String? createdAt;

  UserDTO({
    this.sId,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  factory UserDTO.fromJson(json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
