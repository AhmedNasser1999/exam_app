import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/question_result_response_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_result_response_model.g.dart';

@JsonSerializable()
class ExamResultResponseModel extends ResultEntity {
  final String message;
  final int correct;
  final int wrong;
  final String total;

  @JsonKey(name: 'WrongQuestions')
  final List<QuestionResultResponseModel> wrongQuestions;

  final List<QuestionResultResponseModel> correctQuestions;

  ExamResultResponseModel({
    required this.message,
    required this.correct,
    required this.wrong,
    required this.total,
    required this.wrongQuestions,
    required this.correctQuestions,
  }) : super(correctAnswer: correct, inCorrectAnswer: wrong, total: total);

  factory ExamResultResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamResultResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResultResponseModelToJson(this);
}
