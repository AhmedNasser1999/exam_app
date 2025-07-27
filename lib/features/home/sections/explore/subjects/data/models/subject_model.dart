import 'package:exam_app/features/home/sections/explore/subjects/data/models/subject_dto.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:json_annotation/json_annotation.dart';
 part 'subject_model.g.dart';
@JsonSerializable()
class SubjectResponse extends SubjectEntity {
  List<SubjectDTO>? subjects;

  SubjectResponse({this.subjects, required super.icon, required super.name, required super.id});

  factory SubjectResponse.fromJson(json) => _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}
