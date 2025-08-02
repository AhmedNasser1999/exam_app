import 'package:json_annotation/json_annotation.dart';
part 'question_result_response_model.g.dart';
@JsonSerializable()
class QuestionResultResponseModel {
  @JsonKey(name: 'QID')
  final String qid;
  final String Question;
  final String? inCorrectAnswer;
  final String correctAnswer;

  final Map<String, dynamic> answers;

  QuestionResultResponseModel({
    required this.qid,
    required this.Question,
    this.inCorrectAnswer,
    required this.correctAnswer,
    required this.answers,
  });

  factory QuestionResultResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResultResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResultResponseModelToJson(this);
}
