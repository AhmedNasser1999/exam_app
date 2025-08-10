import 'package:exam_app/features/home/sections/explore/questions/data/models/quiz_model/questions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions_response_model.g.dart';


@JsonSerializable()
class QuestionResponse {
  final String message;
  final List<Question> questions;

  QuestionResponse({required this.message, required this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}