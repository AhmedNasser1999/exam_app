import 'package:json_annotation/json_annotation.dart';
part 'profile_request_model.g.dart';

@JsonSerializable()
class ProfileRequestModel {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  ProfileRequestModel({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory ProfileRequestModel.fromJson(json) =>
      _$ProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestModelToJson(this);
}
