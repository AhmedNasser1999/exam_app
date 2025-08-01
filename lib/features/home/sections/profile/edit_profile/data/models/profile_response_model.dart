import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/user_dto.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel extends ProfileEntity {
  String? message;
  UserDTO? user;

  ProfileResponseModel({this.message, this.user, required super.username, required super.firstName, required super.lastName, required super.email, required super.phone});

  factory ProfileResponseModel.fromJson(json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
