import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_submit_request_model.g.dart';

@JsonSerializable()
class ExamSubmitRequestModel {
  final List<AnswerSubmitRequestModel> answers;
  final int time;

  ExamSubmitRequestModel({required this.answers, required this.time});

  factory ExamSubmitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ExamSubmitRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamSubmitRequestModelToJson(this);
}
