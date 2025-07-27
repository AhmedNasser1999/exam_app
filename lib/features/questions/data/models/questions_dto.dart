import 'package:exam_app/features/questions/data/models/answers_dto.dart';
import 'package:exam_app/features/questions/data/models/exam_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions_dto.g.dart';

@JsonSerializable()
class QuestionsDto {
  List<AnswersDto>? answers;
  String? type;
  String? sId;
  String? question;
  String? correct;
  String? subject;
  ExamDto? exam;
  String? createdAt;

  QuestionsDto({
    this.answers,
    this.type,
    this.sId,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDto.fromJson(json) => _$QuestionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsDtoToJson(this);
}
