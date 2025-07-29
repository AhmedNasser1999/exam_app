import 'package:json_annotation/json_annotation.dart';
part 'subject_dto.g.dart';
@JsonSerializable()
class SubjectDTO {
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  SubjectDTO({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}
