import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  String? message;
  UserDTO? user;

  ProfileResponseModel({this.message, this.user});

  factory ProfileResponseModel.fromJson(json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
