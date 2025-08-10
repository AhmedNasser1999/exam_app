import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exams_dto.g.dart';

@JsonSerializable()
class ExamDto extends ExamEntity {
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final int duration;
  final String subject;
  @override
  final int numberOfQuestions;
  final bool active;
  final String createdAt;

  ExamDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  }) : super(
         duration: duration,
         id: id,
         numberOfQuestions: numberOfQuestions,
         title: title,
       );

  factory ExamDto.fromJson(Map<String, dynamic> json) => _$ExamDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);
}
