import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDTO extends SubjectEntity {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  SubjectDTO({this.id, this.name, this.icon, this.createdAt})
    : super(idEntity: id ?? "", imageIcon: icon ?? "", nameEntity: name ?? " ");

  factory SubjectDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}
