import 'package:json_annotation/json_annotation.dart';
 part 'subject_dto.g.dart';
@JsonSerializable()
class SubjectDTO {
  String? sId;
  String? name;
  String? icon;
  String? createdAt;

  SubjectDTO({this.sId, this.name, this.icon, this.createdAt});

  factory SubjectDTO.fromJson(json) => _$SubjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}
