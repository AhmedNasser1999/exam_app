import 'package:json_annotation/json_annotation.dart';

part 'question_exam.g.dart';

@JsonSerializable()
class QuestionExam  {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final String createdAt;
  QuestionExam({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory QuestionExam.fromJson(Map<String, dynamic> json) =>
      _$QuestionExamFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionExamToJson(this);
}
