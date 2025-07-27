import 'package:json_annotation/json_annotation.dart';
part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDto {
  String? sId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  ExamDto({
    this.sId,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(json) => _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);
}
