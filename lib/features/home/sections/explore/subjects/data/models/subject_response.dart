import 'package:exam_app/features/home/sections/explore/subjects/data/models/subject_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  final String? message;
  final List<SubjectDTO> subjects;
  
  SubjectResponse({this.message, required this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}
