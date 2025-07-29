import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exams_dto.g.dart';

@JsonSerializable()
class Exam extends ExamEntity {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

  Exam({
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

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
