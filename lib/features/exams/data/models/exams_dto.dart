import 'package:json_annotation/json_annotation.dart';
  part 'exams_dto.g.dart';
@JsonSerializable()
class ExamsDto {
  String? sId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  ExamsDto({
    this.sId,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(json) => _$ExamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsDtoToJson(this);
}
