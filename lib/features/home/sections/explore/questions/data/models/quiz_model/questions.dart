import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/answer_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/question_exam.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/subject.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions.g.dart';

@JsonSerializable()
class Question extends QuestionsEntity {
  @JsonKey(name: '_id')
  final String id;
  @override
  final String question;
  final List<AnswerModel> answers;
  @override
  final String type;
  final String correct;
  @JsonKey(includeIfNull: false)
  final Subject? subject;
  @JsonKey(includeIfNull: false)
  final QuestionExam? exam;
  final String createdAt;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  }) : super(
         answer: answers,
         correctAnswerKey: correct,
         question: question,
         type: type,
         questionId: id,
       );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
