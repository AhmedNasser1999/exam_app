import 'package:json_annotation/json_annotation.dart';
part 'answer_submit_request_model.g.dart';

@JsonSerializable()
class AnswerSubmitRequestModel {
  final String questionId;
  final String correct;

  AnswerSubmitRequestModel({required this.questionId, required this.correct});

  factory AnswerSubmitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerSubmitRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerSubmitRequestModelToJson(this);
}
